Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D92D33D6D7
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784007251; cv=none; b=WnueeNqyN6b1Gyeub9JnyD92eYcqGyGorT942e5e0U7FrdGgzWVNsO1RWfqQe5CWX2EElYWvhmyiBN/CZe0nLLcxYoX+rW4FhpXTHXV2kcpviO4c0fIfR0eIBKVLHHwQ5V9ozKBNosnrpPHh2NPun5Cs8hgNnaZtCmjrwhMWHuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784007251; c=relaxed/simple;
	bh=7FMZOy98v+vdLFCT3/0VGFUv24YLEv8tA8oNos6MiCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P68aPOQZN5G1wQqEVZI9yCmX52vhZSZMbOznjJTf6pUTlvLjNHYr+U4PgjYb9w7vy+dfFI9vv44yCWypYqE0o04GOLHxwFW8i2pSyXiDhAkg+uTbZMPts/PwXav6zKfyR+PgqLc5ZUnMrGo1cjKGhBUdWGviolkabEJmQdb53rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PS0M+lfB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HOfD3W+K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PS0M+lfB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HOfD3W+K"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38KS73390356
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zDR26r7yjwJawRn/G8rFuIZ7JcOVUBQDcaIis7n20aY=; b=PS0M+lfBPuD9X94P
	KTGi+SdWEJVddX1j2400skEP2TRzeZtCRa6MW7fl1bEQryWrXv4KgyEj0Vqk/a5s
	Ij3c6pRFHTmBiwd1GiaQjckZFd3FsoJrWWS04UwpiQd4FHyflFK/5ZPZFfzhwUr7
	iqrWHLqu/4KGGccNjrbgsxCWvaticOW0T4no6Z6yBcmZpZlxwaDf3a9XaApZ9D/d
	nxScEczcTKUwTN7lighNH4mZfHFRG52EACTLrlPBxPZQLDl+F0T6JEu4U3MrZRxx
	RACqtKMVy+E3wl5YWERkCWvItPOXnZyccQ/uI9+4llsqczlNGoNCemTGA2Aw6RMW
	sHvYFQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwu4uw9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 05:34:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8484b57b98bso7728502b3a.0
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784007247; x=1784612047; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDR26r7yjwJawRn/G8rFuIZ7JcOVUBQDcaIis7n20aY=;
        b=HOfD3W+KcQ9cTX34Z3Mh42NeQO0Eh7DrdZ4HwoNiA+PKez4XZ5YnsZl33Zbh2n+7Y0
         AWTvJ3WHPDsl352TaZZ6rf1aFpWTJSDAwGcuPFhyaPoc0wiWbSZLOESAFjldAzMlCLlM
         Y4SFReE+48ND8HlTr7CQVL9xbGUeGQbr/AUmTSY5zOM0Rk/gjh2Z/XHjGDjL1h+6Q6oH
         dKw1Mxv+A+wA5zep3GCG7pEoN+nykBLdkx3unfRduEF3yErVe8J9py4WB7QlwE0+NaCh
         r1F7SsL3pkEpZnxvJHJDQP7NIOuuBJSPwtx77OSelGOA355j1IngEILVc4I4T6VM6tKR
         tI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784007247; x=1784612047;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zDR26r7yjwJawRn/G8rFuIZ7JcOVUBQDcaIis7n20aY=;
        b=ewPzhUIW/PPS8ASPGUe8PBbFoRs5VFa0oin8Alxi0dkWsNpEF+Dn1ClGTTf8I8OOJa
         cAluEZ+WdIbWlIYxM153ZzmsePBlmf5SWd8uSxkWBXkvKm/qsBrg8NvRYWJdxECq9IeM
         IafdNJMY6gNWVH99rDvTBhDIcCI7xwO9ipWIs+PjLi8EThfwXiFe+6TkTU7mJ0JBSy83
         jea4jcN6o2RCsNbqEw2DPyQaqVnxCny06L3a2+LYcBUmfzWQOf9l4b7UL2TJ+shOljhV
         zYdgXWaUCONLZHP2cYP6Lv79L/qoPJi2ZspLJvm5M2U8QPaBPlhI9UGrpbAy+vrSX04A
         rHuQ==
X-Forwarded-Encrypted: i=1; AHgh+Roh1TbiCtKm/2807PmxN0yDi87MQl1MAqnW1IQ0ItBcxvWfF1wEMs+Mbf5Ku7bSKbaejJvBWGn7ym6M@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXfwaloHYP/L3X4HhJgFJXWE+TRk42AbPPKNrSWrZK3ycE6Mp
	vZ0Gu3TtK8JTxDxMKD1XEOOJxAbOznyo5M0/a382w1DGFipyuY/de/4uL8NhRFlcNtEiaNsSxio
	5da/6qPi4+VdWA0cFNHCbnYq6mMVruDlgeoIMCmHWEdIQCgcyBSvN4BgAXgT6+wsW
X-Gm-Gg: AfdE7clTxN/7lOlCPWWtxye17GmeZFLSV5668FONSF3ZauVUHgTVaxx5ldq1wUFA/pq
	wG1cIIKiXs8baxBfxiP2lVSGiboVxOBYCNgHRM8L5v/0W99116l0cAGBEZ4EoF29l4iyLxNYNxV
	luGZ707i+oObjV9i0/6fG7dC27WvjeGykxCZOrn6Lc/MTKF9p8CJ45Cw5UvaXUBFOu2fSXlh3X7
	eniLqRdNzBJmWY2di2g+XHC6P46BGKwoocwId99cycoOaUhvE667dB1WFp8eVV/u+l3Z41iV83b
	z0hGBfhYUBfqmAOZ2557Hy6EAdaKfPhh6cdpE0yF9UpkrrFD3jBHm4clbCqfoNE+04D+YMBS3le
	LrDjCoZv9+4KdqWgnjv//a1Pe4ynxOYPWu+XD8d+wp6XkWp0=
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr2104229b3a.14.1784007247448;
        Mon, 13 Jul 2026 22:34:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d1b:b0:848:599f:26b with SMTP id d2e1a72fcca58-84a5140f5b2mr2104205b3a.14.1784007246998;
        Mon, 13 Jul 2026 22:34:06 -0700 (PDT)
Received: from hu-vishsant-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f6bebcesm846227b3a.32.2026.07.13.22.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:34:06 -0700 (PDT)
From: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 11:02:31 +0530
Subject: [PATCH 1/2] dt-bindings: net: qcom,bam-dmux: Add
 qcom,shikra-bam-dmux compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-qcom-bam-dmux-vmid-ext-v1-1-3f29da7cca76@oss.qualcomm.com>
References: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
In-Reply-To: <20260714-qcom-bam-dmux-vmid-ext-v1-0-3f29da7cca76@oss.qualcomm.com>
To: Stephan Gerhold <stephan@gerhold.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        chris.lew@oss.qualcomm.com,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784007235; l=1495;
 i=vishnu.santhosh@oss.qualcomm.com; s=20251203; h=from:subject:message-id;
 bh=7FMZOy98v+vdLFCT3/0VGFUv24YLEv8tA8oNos6MiCk=;
 b=7ugYefRAQ74PZRiJjRR3AS/FyaCU+wCZLNUGkeOYD3eBpBzFdVUt9318rSpKPxm/zrPWchgOx
 w+3ujQUYdETCH8cpup9UIur/FtrtkpBxGpQ3bcgiNFYAt5RQ2bd44SI
X-Developer-Key: i=vishnu.santhosh@oss.qualcomm.com; a=ed25519;
 pk=G8/AJPecB1feGI7wxArGWGN0PPGQS0GUaD4THQCbdis=
X-Authority-Analysis: v=2.4 cv=FMErAeos c=1 sm=1 tr=0 ts=6a55ca50 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uOAgoggzd781rp7tEncA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX+30QeS1yOvxj
 3eMCv5YtZyE1xvT4HHoHGVX8Nw8oF/iyyHLOanwHheEKdmNUSTc+MSBKkPdcIUvVNpJSUVzlWQy
 6kpnmNCWfl4RNKpB6cjwpKRtMC41WlU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1NSBTYWx0ZWRfX9VKN+y0z2L09
 SZB9SXVmhub+uq9JCHZ9n15O5hNoEHG7314lWxt7spoYXhXuIRQedIixT0AZ0bGcP4GHYgjDG+l
 jdwHw43p4VLY26ZOe8J1xIDgPtQvk8OSvWH76W+q4v8a9sRwScxqxdMnC3vDpH3WK4UIBMR9EiT
 CeGaAeAX23tGANyQx2t0arr7iOKeS+jzQ89qF9ChGWVhcUGdXkBDpXA6jeoU0Xx1wGi8UGDG/Dy
 hNKDA/rhZpwFq3UatsQlszypxFuBU+LnpvhioTcLKIy/5IZdawc/+/PNx77oO0aAb+/unRiSRP3
 wjQUtA7t72n7YB46lUJl3hJm6vkigUznC8yOCsnrLkWydJ1oefpOzxSodmjGa2x55XTgufheyhF
 BlMoqZKZF1LBl56LJJgpjdbrWy+2XKLlrMNOVMpKDHf57u6WLAQ3+dhUeLpPu6Xt+gjBB+sEgTc
 p5cx6Mx1JJF8idemS+g==
X-Proofpoint-ORIG-GUID: YkZNoMuKpsvZU882zo2TttwJgDgx_r36
X-Proofpoint-GUID: YkZNoMuKpsvZU882zo2TttwJgDgx_r36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140055

On platforms where the modem DMAs into the BAM-DMUX RX data buffers and
the XPU enforces per-region access control, each individually
DMA-mapped RX buffer consumes an XPU resource group. With only ~16
groups available, the per-buffer mappings exhaust the table and inbound
transfers fault.

Add qcom,shikra-bam-dmux as an additional compatible for the Shikra SoC,
paired with the generic qcom,bam-dmux fallback, so the driver can match
on it via its of_device_id table.

Co-developed-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
index 33746c238513d72366bc52359fb10f275475b331..27f0fdf285c17d6bfdecd5e59cad09912a5e821b 100644
--- a/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,bam-dmux.yaml
@@ -22,7 +22,13 @@ description: |
 
 properties:
   compatible:
-    const: qcom,bam-dmux
+    oneOf:
+      - const: qcom,bam-dmux
+      - items:
+          - enum:
+              # Shikra
+              - qcom,shikra-bam-dmux
+          - const: qcom,bam-dmux
 
   interrupts:
     description:

-- 
2.34.1

