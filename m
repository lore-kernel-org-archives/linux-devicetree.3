Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107880;
	b=3lpnxKm8Pg8E4Ns6QnwCMIZROq2DQppyBw1xRLC4YNI8nMyyhyUlYjodYouqwVv3cKGo
	 Szc+5iB5J1KUcT5iUvOjjuBT2hfXIZg+AGv0kt0vxabSFa4szW6MupnBi2fOlkwBVRlo/
	 nMvFOuh9pRB21kff5+SEL1nx3VDVPz8Y/i6JrCngn7g/rZ63V2AurGWfz9hq7bWRMMTOn
	 /4aWKnubaGCVjiWplYIS4pIE23gWZeumvScPBXefOuyrWEppd2S+DgvfMnDa2H8uPV0cA
	 e5KIPVPCdp1Iz4lPJLEhUnwpiUkDkwReRd90WKShoEjn9STcchXRlcAZMfAiq42V0fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
	b=OK3XDMLu0w8NsXB36cLdX9Dn8X4D2FT8zVNKrrXnqhbXAT6oScI5jt8iGFwuNQi0k7Pr
	 yss89J4V3un1zawD6TbVOPPeWaTXEwiFvN6RrS18kwwW4Rm5n1+v5YsD40ofQeN6lnk+b
	 a9TxFAno81xkrQDsXN3FD36vzbf10G6kDI2UNqaYsEqeShvqGq5clrQ5H+/m9q2pU+P0s
	 HPjk3VMDq2Zag984thOA2KoEef/sywfIE9Vv6NRBHliPR9yCB1puYGSHsUxT8Zn4lSh8d
	 6/NGTqpk+0bj02xqSLMBwK8d3mPh6hQfsmSLava7g49jm2K3s8pgXKUPEpfOSNCQfLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTuNbBZE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiz70M6S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A7060A2612
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3A7060A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTuNbBZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiz70M6S
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGs55A3016470
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=; b=aTuNbBZEAbYXOG8b
	C/Yu31pC4/QFAvBtjK41LgXmCvjHAk1DGATDoLuLeKK9icPJdxDjdl/E7uMKyHfl
	0tl99Dj2PZJM4pX/0abi37EHW7xf72AN0hDDF3h4WdF93sEhnQ9vJZI2ZKvFera4
	PVWj9ImhEKOOx7vTiTyeCTwSYZkUXQ0C0qJesmbnH0+U7CzPnpabwRg8eOpos8jd
	LBbalkSNgXkRIfS1oVw40d02Ao24rS8Y57sztkPZtXwW3LgxKbzvtR5Ij+AhHHVN
	G7bOgmGQNKndT30PvQNdrX39Yk8M6L6Wp+g++rdMrn6a+xR2W8QqZxRR9nz6cnKB
	4s3XCg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1pdcv40h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 17:04:38 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so957935b3a.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 09:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107878; x=1795712678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
        b=Yiz70M6SJG9zSa6cHlv/oif7aWaCrSBeMqWVJlXXgrkwc8UYuBPrmkvvvjF1ocXaHE
         mvahlVdbywMDArLq6d8waobM58IStAZPSZPrQ7ZoQAfK2nNrXCbVo8d0yt2irEoTtl2d
         OK49XhNUctUB+FkmKPH4bv7OlFo6W0TLqg2/ybquBnc1kvD8Mcf27tpnpNA66pTqcjUu
         r2ihQzG+Qa+eGOqIP63EfMfQYCYZ+O5sib4i8Nm1GowS/mqi5yjnzGh5pTDX3SNWztQu
         U7bImwaxY1Pr37VxwSPhjRwQHwt+rv6OrFmq6qXte2G9LtO7myBvgC/heDc1QzOW95Xm
         49Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107878; x=1795712678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
        b=N799LZSUksoEMv3YWq+b+NgowYecs4E/xTrtAp2ND5NqJjAp6FAHOJcAG++fpKXoTJ
         IaE7tF2pD0R7LRgt0z20Yjd6AGQwSIDpgabUS9Ah6esVAAaVApwALv6FjLAqvCXPuIQQ
         cFeOTGOryRwsf+nrCBLhrIjmf1orhS2hZQLfHj4QimuWovwxf98T/HUhbsI3hzNFRm8t
         gVDcjAUnzfwjupHNYoG09WDDOHcxSoO8WqZgFkFvA0W+4bMUbxmpsqCIU4RQOecbHea8
         +vQHCI4hN0ty4U5QhkxaV5fOFyGAluOdGLqOvXqoIuP+k/frGiSdrLNfYnGWiWumL0JY
         iiNg==
X-Forwarded-Encrypted: i=1; AL+hErEJc87CMYiIXMIZMd2OJxHhDPbo50DcNA1ZUbqylOE9F5NipIj71b+T+gNosH/YUDH/8TqQEpknf5zo@vger.kernel.org
X-Gm-Message-State: APuU4Z+9ZTN/WRu29T1fHdj9x3Mh3gCRM52y3Ka1AfFRXI5LzZOYZD04
	QG5zH4Ush0fh4Lo5yQfV9bQ2k8xfqSISnSP2ZG9lDmcQuMVKWjhBCJJKRmvBVPkxTdz4+M2b0rc
	oKeWO21VLukyW4ssaq8CR/b3qz8rAgXf6/iCyqlLEcUk2oBmNOzU9nG1Sj7tzob75
X-Gm-Gg: AYBFou0yzzOZMKciDjJiOL0bNqJaRpKA24K9SbG5zs8z5igmXbuJyejGQEY6rM7UMaM
	9v7YHtFhRcbiJLKtJ6peVZXEXKs2UOM/YSyiAI4KFpOzXVaMLFYNo9jUfHhtCyzoFGwEEntmZ1G
	jSgJyphsCZoy5DvuJiCk8YDxCQOBnnVF0GiftpvItRCvDQnvGsl8FJVP/ipcoWZEgDn+BZPZWKw
	PZDsvHvK7zSM/HBsemjFXx5OAE4xyPxBnuxfYtSCv0PWD8SmBu28qDQFOL/2IKmlaIpIu6vExxy
	TNO8qAtRALzjI0USYE7UmABf6BhXLDAhBdfGbQdfKFh+4OETIfy9wbG7PQ0hzGmEyGjFcbDrTrJ
	2PkKaKGQ9nilGb9MNbWSu+of4XD3U/qgRKUWTylEN0CsahugCLZGwvkvQUsoyosLcsNAgqoQ8Fw
	==
X-Received: by 2002:a05:6a00:2eaa:b0:8b9:7b94:19bd with SMTP id d2e1a72fcca58-8c7dd3072a6mr1299161b3a.13.1795107877602;
        Thu, 19 Nov 2026 09:04:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2eaa:b0:8b9:7b94:19bd with SMTP id d2e1a72fcca58-8c7dd3072a6mr1299117b3a.13.1795107877077;
        Thu, 19 Nov 2026 09:04:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 22:34:20 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks
 for Nord
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-gcc_i2c_tsc_support-v2-1-dcb91a0b0013@oss.qualcomm.com>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: uJ8BtNGYw_3cbOuJi2I1xWDFe-FNZlWy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX748Ap8gp7wYt
 nVr+pbLy0t51hGCgJxtL5bI4QaGxqXh7uK5yIsPT5qnVj8a1bIr5R0UqfbPyPlnnQOi6wDGtydA
 Q/IjmzyDEOYA56vMkjGeTTLQIQwz2+w=
X-Proofpoint-GUID: uJ8BtNGYw_3cbOuJi2I1xWDFe-FNZlWy
X-Authority-Analysis: v=2.4 cv=Ma/5KJ/f c=1 sm=1 tr=0 ts=6aff2c26 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX2cFJt5paYtos
 KH1X3iUX8hgY+1pL+0210SipbUdVSuE8XLwgBc1AG98GNq20g1QUzOgt11hcliPhjmlgCkSQ4FX
 pWqPivofdH6mCvm+6VqlRN/9apwGtA5JmjLOD6oulIVm2ej3j1gvyTgpex8gpiuAunxptepUP0X
 9X/9r3UG3rViPKLyDvQm7l4cCFnULhJkmMK5jffqB6BEtcyG5nhxn5C7DzvXIZxpfFm+IJXVVCi
 YHtIWFS/Z8lreeKoHy8pd7gKKTwdpJoZ/IQceUvSSqbNE0wxtbKC4zg/5uyvkDItqMH9Q/j6Q1x
 nrHbHrrmVwIkmLAy8r9szY0EPQF51X0dNqxMNK8PevDpNx2VR+W+vgV7r1qrzu204n9KPiXVdtd
 xnsyBZ8K69PLdgvHfWDJryo9gfeH65bGqGxE1lRNpYBzZLu/CrrdnBMtfEonufySAT3UO51i5SF
 g5y4wBzf8RtWsyWzlug==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190067

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..f8d6963f226f151d8cd49aba9ab98f9972f8cd64 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,13 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_I2C_SLAVE_AHB_CLK				79
+#define SE_GCC_I2C_SLAVE_XO_CLK					80
+#define SE_GCC_GPLL1						81
+#define SE_GCC_TSCSS_AHB_CLK					82
+#define SE_GCC_TSCSS_CLK_SRC					83
+#define SE_GCC_TSCSS_CNTR_CLK					84
+#define SE_GCC_TSCSS_ETU_CLK					85
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +103,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

