Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794315784;
	b=CkGLcw3LYaCHAqp4HXwSMhhYsc45gN3iAUHYApSu8Emmt5PDn3Plyib9wvt9jjhKhqR9
	 5VcKuVn+RD1LU8xB1mJidCG3PqbSFMWS5+yt5GdMK0ajT3cciiC88uyDjykYyCHZQUM7g
	 9EnU9ACD9cnr+RlZ6rSpOOKUtseDTiEhKz0gdtaIKibE0am2N2l8bMukngDS6NRon96O8
	 zS5xTS8bquXWi8IA9cy9TeJV1RQmH6Dm9fzcl002x62mCFCRZYyPB7gNTNAjVREo5/Se4
	 BgmkTdHcOGcVxMOUN1u35wmdk9aezR9JYvAJl/YPSex8G37fHFtuRzlszw4eWxdGW2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794315784;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
	b=QzG8w/nETM2B1tCSJKF3kMBLZENcIkgoCQLaFxvKb1mtMJkIKJmveTe8rxmRR7FOrWkh
	 LYVvBr0FruxiGBu0edtdKVuXVsLmEjwJ/WC7byJskqWk/V197PS+Emj5hSkZ2EPzVXm54
	 Cb3KPqXnQyfdxlwqIYKJGPLFH/KJGM3MuJtl9z71pv6nknks6UJfw9XJUue7MxnXDRE85
	 d5XasJ4gboczowPV4hQPPYA/AD3WGLjVDaei3DtoE/0RHafvZpZesLQyU2G+gMQiuYEHp
	 dkc8y/PKa/p/wqRWr3yMVV6DDn3mfrUbgwJw7TAsLsyXTWxJvf9+CKLose6/0ISutvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvX39h4p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhHH8t14;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081F6070C87
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8081F6070C87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YvX39h4p;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RhHH8t14
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAGO72688070
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNb
	ODqepVpc=; b=YvX39h4pORto6tcpRFvnzK5hYYt3WBlKs/UU8rpssKijGYuCc0j
	lrpk+ZcOd3zDJrWTm9zAUHkYArNm24IEABX4HFVQ4eWNj4cFFPMexV2lYJYboioj
	EwJnRxIe7h4ru2S6gEwgRSR3Eshjo+cc+lNVzVyT4Vnt2rMA49rxUqLBhXx+oXnb
	jHyj9oG3VePfLUjdM4PxF7aL996dQChZNfTViT5xqVfWqKK1dqEvhBHzrGKCHTeR
	5pVGf48m1BOjBZufKnMAzhF5Bo1rGHu95gGO+3X0TO7ZYayHSxcL+/5cdMBFEC/u
	eMGGvXlfIvGGeLbH8q5QHspKsPSuxM65LsQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp21gp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 13:03:03 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ecc172164aso1522480e0c.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 05:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794315782; x=1794920582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
        b=RhHH8t14aX5OOY08SjMfYD5PxzA6gMoc+nngx66uPU6ryLNJxq1UZ00JU25zH+LFYL
         E2mZALi6d7tr0nJTl7amaAfB3PjdpYxYWWc8VXiteiu9CatBBRuT7kdSzIkSxxsvUP9Z
         nDapxtk+qzDJ1v2CGfEL9hMyRxH5uDc3WepHg/fU/GbBjyp0UAufmTvXJjdxdinf7Vfl
         UpBI/V9A+fx81PrM48rirX0VAFocvPF1qbBn4ZvNyiDPqqEPd/Qwfhil05xJtJ/6V4R8
         KUM697NuLj/UCBsTEnBf/CYGheBn3HAJ3q6UW+g9ImFts9g5v0in0lc6E5hZaYY5nODJ
         ukPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794315782; x=1794920582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OALV8vUNInuby80JCyIJlfai0hgF0F+FwNbODqepVpc=;
        b=n1TlSvc5+H5303du9+KKMfdj+JhdsikJB2rblWHXBzNQB8Aii0SlIlBRENlN1O9dJg
         Xh07rs14E/IsnOZzA63NAqPNUzHDqOMA0i6t8dReRR3A1GrY0VtL4ohixY2OfMz6VyWP
         VJltVs0YqfDss5qOaVM6yb0gKDPalIIYTMcjj8TjIl+gIteBsZDQIMpRjCNxd37P/f06
         Tl+eOHbS6pMaG3k6TZ9J4TEYJWv9G448CmejUlpIduczdNZT9kpam0WQFbTigQn5OE7u
         v6j4I8RtAkZM5fANx8nr7jOKOELJceOYGky+eRBNHo/0DhV3ogki/YB5Y4O6qeJs+Ryk
         bYwA==
X-Forwarded-Encrypted: i=1; AL+hErFp+jaExUp19O1+CHUdb9XWmSprH3KJy/XTEJzKdPCirZvM5WKK8V4C9W4vjWggym5zcyowGBhaSR5D@vger.kernel.org
X-Gm-Message-State: APuU4Z/9EcfVoADjMyDf1TUu4p/iY3Dv2tlHcdIwOU0mWXhvhjMSCEEF
	PgO68EaXicZJOzcQ1yVJIO3FPewzlRRXFE47WqxhDwaLk3PYutL1IBWYjatsDmJTrh4nNpyrv+e
	2auM6U2BvQgjKuKkeiYZqrz8dC6qvKwMCxy5P61Y+xcTcX60CnmHK00YaRnftLCsp
X-Gm-Gg: AYBFou1EJJn959GGgRBsYRgAYtHJwU1TVA3Zbbk8RSk2cpVCYmyYEW9qQnoPaF4hgFy
	AWkr0VBub+FH1B9o5j/BzXg63xi3nbL/KiLMMNpW7qZogU7x5cDOsV/W/73uuWpV+O9uJzMyU2J
	gTBgh/d1T19BtLYlFJXJnxTvUM/RXNPsma0cS74/ldTiO1NrGTrFFzkeP5FI2t/3xsE18+MoAeC
	P42aGFqR45DJjRcCvdSG2XZYNLQ4/uR77kU2L3u05UGwB2q3ntWKfj2y5rDeWbv53NA0vyxOzU/
	aBvlmeBiGN0xaJUPdiDv2Fe/Nu2i7im9uR3xSc1+Qjd/agiVxTeDftZmi6nQBTI2Jvf6dQNtQo5
	WiM/YL86hEw5ATsTecczfsQNvwstpfe5CA9WLdvwJPYR9h6hbbJRcmtUtNHZCyw==
X-Received: by 2002:a05:6122:8c8c:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee0d1eac60mr842142e0c.23.1794315782386;
        Tue, 10 Nov 2026 05:03:02 -0800 (PST)
X-Received: by 2002:a05:6122:8c8c:b0:5ec:5f1b:f725 with SMTP id 71dfb90a1353d-5ee0d1eac60mr842031e0c.23.1794315781206;
        Tue, 10 Nov 2026 05:03:01 -0800 (PST)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0236f03esm49121585e9.3.2026.11.10.05.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:03:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: display/msm: qcom,sa8775p-mdss: Remove bouncing Mahadevan
Date: Tue, 10 Nov 2026 14:02:56 +0100
Message-ID: <20261110130255.134252-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=gnpSXTmvxtdhncMRhWieLAr3GFCRnWpMUR0hNvdBVWI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq8xX/gD2I5kvb1YaQbaK1Hj8UhSJ7L7MJAvGQJ
 7k1aiqFbcyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavMV/wAKCRDBN2bmhouD
 17/CD/sGFI/+wjlERaJ3BaT8xEiNlo4WsdazaWIt+yqGEwwmOGNnspemY6phkyMur0Ch/yEal3a
 a0tuhSFEl1ZsKnrVf5TyrKwbM0tO1fwW9H4NX6Zk5TFnC7IQGqlgM4UFFMgnD5TxKhZqiNQiHF+
 mW7ybexMFHJ2x5JAdfazGmya8YfXbrwUxGTFTVaEWdYhsocu4dHR3dcHaoKaUcr6Cjq5W4y7IW/
 ipdwwqFuB1NzhcwepfHTokkewlD7NKUmng7EmN7H2/d+Q3fsHye8RHRec2VJU5JfE4C94KLkNON
 zFaFlTJPRVevVce7u4pAmKFQTZoAbB0H5EoGP8Gkl4AE6yJ4+YGzKVetP69EHmnWx/NYl8rnwvf
 j51L3lxJ+U9QaPmTSITfdaTWdBqW8xSFHMyu70gYKdTTqQqqRo8l522iB3DQIaJEVyFdPhSBQnm
 9TwE6DQVBakI2u7Wq6BdWA4zuiXfLZbTRD48o07rnK12NIQbIDI2HBFj7uJ4/Jdkje3tQ2bGu/c
 f1F1d20nWvI1MipHiWB/kSDBH4TeA01f60/GpPIpHnxIKBD24cYH65wtnF8Dd1sHIeqxinWT4Ua
 iaMIHCTyW3T8+7TGz0Viyro2IOAlOrBa34uluDdzL1rrzjccOzXbGRhRZzaPv7Y+uoBcGUC0TqR /VlewK6oh8hBQFA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: q430aurAzS_FEzrbViyE3x3RQ2sLPsh0
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af31607 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=pRY3rvhn6SD9K9aC0tYA:9
 a=tNoRWFLymzeba-QzToBc:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX/1b4AdZUHpTT
 sFupzYbULFI8s5MNL+Cfr6QWuDDaUkvgQs9qBJAIdeXn8G0fCHeV+ZllEKClsUAcvCJBh55hlSK
 C4rjbq+kBjit4iBc+MWadMLlPy6PeY+H6sHMDpp1xNl8LleQcmiaz0C8S9hlvSJDBHkdYg2P2Jj
 f1Zxz6tiQ3/naYhVDU82w+jQ+wHsV4ivGobXYkXlrEMk0RmxsIbdbNJiF8LVoht3osdRb5js7rq
 2jdXVsLW3UCNsjD8IJi1TfOxMB7uhJqS39Uwp9lmzq+oXhxiek2hS86qsQVU2H6miISuEhWR8uv
 tOElSvfNiB0PgxtVyOw1xco7qSTIxAxLtkfhAPCdEJ/fjm1kpiEo13S+iEyEu7X2pstclHIOem1
 biJs7kWfirrP7NU4xLvto6NjQDSxrMC0zF7eGBXb5VhW2SmuyRRF8fo0q0uNXOr53NmE1AQOhNQ
 prg5V/Pvsz2m4ReLx/w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1MSBTYWx0ZWRfX0jXs0DBwxHzd
 ubKrdFLo8H7oWyZ4OBwO2I7y0RrZ3hppHqGq2DQv/5NAg5OsTzZeLukVgWBErHrNkxYag0ng/fH
 INoSoxQpjwfIbAoLVmwPq1BV5KKuum0=
X-Proofpoint-GUID: q430aurAzS_FEzrbViyE3x3RQ2sLPsh0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100051

Emails to Mahadevan bounce permanently (error 550), so change the
maintainer to DRM MSM maintainers (Dmitry Baryshkov and Rob Clark).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 4dc0055cd841..48dd897d5d5b 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Qualcomm Technologies, Inc. SA87755P Display MDSS
 
 maintainers:
-  - Mahadevan <quic_mahap@quicinc.com>
+  - Dmitry Baryshkov <lumag@kernel.org>
+  - Rob Clark <robin.clark@oss.qualcomm.com>
 
 description:
   SA8775P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
-- 
2.53.0

