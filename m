Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634818;
	b=vK03sOlzyXrhR83m2l2EGDTk2znxohrEMonGACa7joJezBY2PStll3cLBfz1e6UfHmwx
	 lpW5D/lHeL1cEiOVtG0LhhL7X01byEowWikidWrvMhHNtH1zygBaXKVfmBBTukjRkvfmQ
	 tpwzGHlLvGgYnbS7UYnSdyVgWFkxGqOQT6OHrEn347gTDds4IlVerSxje4M2xUKP5HiID
	 mrmoqRgzSJWArHfrGoDMTpfWdxn/NYzLs/FY7Jl9fnwfLvGgjh27Q6JxsGoUdudfJCtsV
	 1O30Zw4bRMYIEVsF0Mzj1RGE7qnc65pnrUtmMZrP7cj6aPmSsdzzRO9kLI8cLXZvlYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634818;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
	b=zVBgtjn3aEjmgIDc8WIanx0yCpxx5SyuSYJQ0We4r2uAhklQSuo7o8ApB+66SrlFGXdF
	 TfuOQ0f93ZJvGQC74tz5wPvbMWK2tIsaX9w+reu56xBVOMIqDM3nGe9uEoTUfKLNppPjV
	 r0QmAorn2IROSEex2hj08YdUhefFPfETfExu1/U+0euX8whcJAs1O62T+dhpGpcKFP0AH
	 x0aSiI580dgoZDakfZjTq/LmwCZphLdlG6oYMBqVKYEB3RXetdVAEDMapZwVcOFBl4gya
	 S2HZd20HaSZchv3+seDiK9N113HdWO8OQxO/vdRHgK86UqNuYi8Ju8NgjVfv7Xt9sBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFve2r0J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFCF60B4275
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 15:53:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BFCF60B4275
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqNFgVM4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NFve2r0J
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpVFl4062603
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=; b=XqNFgVM4u1/+7jEl
	dfjFJcnji1V5QNjBIpmSXmn0vPhkJV9TvA1kpSQvHMKPKetwC7dL3ojF8efMTG/o
	5Buj2qRIAnQPWkGGoI5vSww6/cISNBqsHC6RdPgBFikN/hchzMiQI5BBpfnG7/dd
	CToucGyxYUZW98YnNEAq0pBCs2+UkufhExCzOXc5/F+kSv39uYP7LqL7DlPHKMDa
	z+1rXyYatSYuoO1Sd5b0BKTndbf++kZXT8AIBVxo9vVmtjmCe759yVBNRHcwqXeF
	vHugSsMwmms246jE5+LFI/2FDaVy2nDDILKK1H4HCGuoF8dMy9V9MHM5Jb6oXPfj
	ydQvXg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmet584-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 15:53:36 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98bcae867a1so487650241.1
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 07:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793634815; x=1794239615; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=NFve2r0JCSektwUeNYNT1FH1XRNh1FtoA1EfEF0/TRN+yONbo2v5zGxA+IMUNRXQEa
         SEq8EiI041FPYOJh31rEFslpdUsqjlaBi3FqNZ8EitN5Sd+pkuQJyrAWRDNynlbWcA1O
         yyFaa832cXn6qyCd36zH6eaFp7jEoSAUo95fIm/xiVJ7HaFGrTB5N8nSjZ9LyoRNS0Gu
         cQzFJVuelhcDN8MZ6RiAB8meOZavdl1twvMjrvX0geq3PVefmnY/3Cwo5Pui7Fw+kOty
         trT1zGin9j5u+nG3jzAlRQZZFcmI/YhgVt6qA87dsUQCtOBcry6CO/MeXFFR91QU4Iv0
         gUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634815; x=1794239615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I3J9gkmF9yi5CuoHAy2TreOE2N6iP5mtEvlt0QvWhSc=;
        b=q5QY8x+jk/+M7+hzwRMbhyhmfVnkGRVupsBpos8kvjFQ7VrQ5B2joKfsaMSpe17Ncg
         /o/jQ1TaVSDJtzIqjfSQA2ojZXGIWo1iutBotaHkT4eeDIeauYcXirh/r4AiuMuvuavO
         xrqXBwKMYTnl3sYwKAwsnsL5Co6usZPPfafjQnVxw8UQ47gQnxy2ON4FAeJMV65zIfK/
         MIArHyNrIMkkf6w6MsvZoEUOVRQWghCdm5Vj2GcNpgapbDFZcol3AvtvWJT9U0nwWXDL
         VM/XmJiXU06b6KSVCK16//E52Zs/GHcFREtxki4nwV9k/27xCFbm25KMgrMZfTod0ji/
         SqtA==
X-Forwarded-Encrypted: i=1; AKwUvBwGqpDy0aKEL4bQTv4mGFivc4YLG81z+O5zJ+EcPR7JbNABNk3FaqI/GEA4iVe/pqOSVyuRgHEU97Jm@vger.kernel.org
X-Gm-Message-State: APuU4Z9bQdxJRS+6U5oWYTBT296S7WUad1AQy40w6PuB8iVrlXtHDW7C
	cQzPHl44fihJxRlL9f/wlC8WOAo5riM/XTg8p4QSiGive4ESquxQIth+60HkihuhJkUGvwTwqVx
	aJZh/pnqa0uwo4VktPP2ayhiCCIgri/11zajLGhzJQ7VVfi5sN7mEmF1ITRfdbwtbk9knG3BuVe
	M=
X-Gm-Gg: AYBFou013L6xRLAlryJP3Rmx5YiQXaCae7Berq8Fkiy4CxEc8LuRuX+MyGw9fExl+Xj
	HFZKSWigbdPn3QoNxgbEyKllJ40sSziZIdW4ukhj6j0ndteCZdI8zUHNfifoQ9LRFKUH5xIGIAC
	rXP5u/480580aFofrjFSLJxRG4jtv8/HXEDa29k6NKbyfUWy8tZOUTZPT12YVWsvfdQwWZcx/57
	Alfo32MtFbuwubCqxdR0slHTpDGyFIWC5VvdY9i9tdy3Rc+95CDnknd9CtHAFtWMMnVzrMg2OgD
	PC4Zqmp7yRxg6PycnpzHnIHHXzqTNUm/htaG8tlGbvuCzRpwKAtBcj96BfFxt3zF8oOZXfbxT7G
	e5ubdrdQVahiZ7zkyKzhen/q/hYkne9gb2bmvQufvnn0BsOV+gd196RybzQW1/uerq5axmuJUfo
	inAs+M3AVeg3TXjW7v/vrkHp1ULeQu5clLG3uRKiCzgi+NIVWQja46HTfQu4v9/9m7QlObe7jeU
	0/2+IlXhqfCNNOgIwCVD5DSopBQ
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862062137.31.1793634815475;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
X-Received: by 2002:a05:6102:50a8:b0:7cc:2bb7:1321 with SMTP id ada2fe7eead31-7d072715882mr3862056137.31.1793634815005;
        Mon, 02 Nov 2026 07:53:35 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8a7d1sm20700323f8f.38.2026.11.02.07.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:53:34 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:47:40 +0100
Subject: [PATCH v12 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261102-camss-isp-ope-v12-9-702254689feb@oss.qualcomm.com>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
In-Reply-To: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae8b200 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfX47iPpg1ZGn1T
 Ev7eByntXuRc1l4v/jvW0TTCbGlGwg7a/qfY75VdhRIbh5OmI73yv87K+kTO50oZcTUKLQx2BTN
 oeS+KNbXoGEnEdlSxsNvv+i71evqTUEfml8u+RETJN65w7s7iMJ+NhJE/ydYubrRbhcUYUKsO1X
 m28isYDhLbSekIIOBoK0GfOM9Brc1LPaJy5Z+O6ESc7lOQmMLGC3alAga8fm4EcgYRQUVBivJYD
 MsGb+nz/xMlzezCcpc+XRyo4xV6kv50q4Ik6BcVfUC6KjS+mDLQliUcq/uFv6fqx+QBB5OHzKIF
 Nl3K+2ntr6gb54SQn/vrpwy77dg1lGFdsqZiD1k00yXtedhJEw3QQbiPiaWdNfsq7k2LyqAI9Yq
 pmnnFw6agk5ujYCRpVNGKkdTpoibgF7i0GBr6hDoiBh1LtNmcxaeMsWtdssDQ4LOFMJEuPIovQE
 tWdszQrp/+IuwjSjw3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2MyBTYWx0ZWRfXyfz8XGpXw2xQ
 TRLcZax7hMydxrRQQZ3TcPr5pQ8iSYr+4+nnwqMe6AHgAOFosC6U4+atrbKd5vB9BI6VIDbjv21
 d4wxjOHJal6sW7WBPyKNKF4ZNtp7d/c=
X-Proofpoint-ORIG-GUID: 5hKDqhWMb8FKn-3v9HWXLCc-xOPD3_6Z
X-Proofpoint-GUID: 5hKDqhWMb8FKn-3v9HWXLCc-xOPD3_6Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020063

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

