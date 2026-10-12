Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BD1368D7E
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791811969; cv=none; b=a1TE3aDns6+i1OX99y0VEw7dd2MgAV+sklJbHoPt5EULikYnMKzsS0CD0qp7S0NSEeVGEZ32D3bHW0B3ExyUR0A3BU0htbip6iCVoBJ+7jvXyw8VEgwjjJkcAo9ScMERYJvUcKDqbbs0hR5uw7b/V0MumK90QAa6wFGSQxbiiJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791811969; c=relaxed/simple;
	bh=Osl1oS3Zz5Z+SHgAJUCq8ikwf9PcZhHV9y0cVRgixBg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aKY1w+N764bEdCt/bYRZXk6ITg3lmrjQpNtAbIwIxadQMww1eFoMryrpqJs7la3hJY9iAIY9gslNWnLsmBGMyv12KpM7O1zL0riQaAB5rLbhOLJ4JZF1ZIPnsaZK/zu3TrYHieJ/XC7StNrDWggkE3HMingje2e+6NK8qr1HPGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QI5QQAET; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkarC5vI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QI5QQAET";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkarC5vI"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC092e1405420
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZGDJDRLWbmhL036D5uBETPd4vljDxOvm5TNYzKP1bqs=; b=QI5QQAET4yMkS9gt
	c4A8N8spreeYatTVGYi1ytTGS+EYe5PU+LDqU17kGLBLp4ib9YheJKvm2rqM/ayf
	0m+ifYkvjnBqS2CFnpiaBoIu7ucg8EF2zFGakvO2H8Cdp8hnygl8WNW2O+kXLKsy
	q9Jgj9h9BBbWHXUmB57JoWiXIQisFhFJlZujcxKHKb0a15Lim7PU8ILFcvpptm3d
	QWpG3E7Xxhb2NZQ/pOoiioeRRAO/CAwutKCgzIfFM1DqC9REl7cYDX/vop75cfDH
	z/n0+RMBm/6knkGzUEASoHS+mW5e/LnzFlghZ1ETPQp7dqPyPR57npMefMbi8QX3
	YdWbkA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8v7ks9u6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 13:32:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359d11365bfso3670394eec.1
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791811967; x=1792416767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZGDJDRLWbmhL036D5uBETPd4vljDxOvm5TNYzKP1bqs=;
        b=YkarC5vIa3FlZQMkAdinIOA6IXJJzXubs1JKKaDXHyxC2szKFaK0oNbMr7LwN1jbR6
         yBa87B0Z43lIRh/uLvA/6KQgPkfI4+/Uudw6ReOrUKFtOzzh7eQXyCi+PUr1mDN4WRg+
         Ow/Sm1qZqIFc2ZevBRpkNYzBaxDhGCIm5YzZeDd+q86kFq1F1uPxrAGWFYF05zVgH7u9
         hAxqmN0SM59pi2/8bTU/U1YJsmTb8ilLf8M2gPpO56ZOSjrI0nc7ityZMa0GvNvhCKRW
         CR6T+cYAHKwVY1zu55KOrpMKnoMqbtd63WMhOjugz77IKabVXQYtU3DXsBxh1Y3YgaUN
         qEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791811967; x=1792416767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGDJDRLWbmhL036D5uBETPd4vljDxOvm5TNYzKP1bqs=;
        b=xw7ROu/XBf2RNPDtbVP351JAg5QbEd1TdGi9R+lQlIsRLXW2D9QauZaJPhtOUxcRXu
         bQrkDUOr5/l/ZCJm5Y9NihC3H6GPlhwjQtCF1xFwy4QjmForOoS99o4G5XV0//hK1yJV
         ANRADO/IanxZDZWkObtoc/YucxCkaHErCps2CV0DXUvMwbDYae4JpRQKcem3aMsAO4LF
         6A+/PuFEYMPjBCQC5Q5d9qy7Xk5jVX8AQuwbdBBUUIOnl66xQtVWGq2ijWsAlOK7JqUY
         TLG1ep1PCjFDK6NsT7EVmHRVS8kVIv4GmuA5iY4jesygEQeSJkylBwDcx52GvAL0gkwY
         nSlg==
X-Forwarded-Encrypted: i=1; AKwUvBy0p8E6Hss1YQBlcr2pjJmr/vtvSoNCiitAJaznDU+iEAglCrbF7kO1iKS09aRemqtAOF7i/JHFRgo/@vger.kernel.org
X-Gm-Message-State: AFq9FYKFxGivYoNLMWlqanWz4cbCmKK0oFtKEuao61YP5UcD2NxE5GpR
	Wdt4PvH2edO9//cdR6o1QoBK87WqOC7yMG2/4oJQHcz3qfhk3D/OPOelCHaXKa8hYT1oHcE4C/z
	5xuajqdLEiwqWB1Re+QjFdPljkn6wrA/taQk0X5HFm1UzOM8ttfdznRwsVUBOY5QH
X-Gm-Gg: AYBFou1mhmR3gTvS/7lTHlzLqwZHOK50KUShJF3kEvyTgTGVsc+bX7EqIUTeF65eejp
	R8ry4RDLJPKpNH91Kq7jqIr8HuJ7tdI/M/aMJuamNkzm9gOvkD1xRN9yYByX2hMjPj3C1+kZb04
	WrYfXFcZsabPrZyawfwTRYEbaaWKAjDhcghfkS/2cUkPDr+6IYdDNuehPXQrQhBeIi0cIsnSat6
	yfYlv4VD5jkEoaXbvAR/1nAVu1E3Zxb4h8ohR/uv0lKHwpEUbpPHkDRItHzocT6R0Tua9/c/Vyf
	Yo5qmTYzD0/Kpyd38yizDRQvlEsriggVubJG8AYTjaA6m1Y5vG7zSKy8oOVHPLSKnKH/GHE6vk3
	dudLSLyAfRSpFG9vAMXSadGMn2Pw=
X-Received: by 2002:a05:7300:80c6:b0:351:78a5:d0b5 with SMTP id 5a478bee46e88-3537deccadfmr18827473eec.3.1791811966880;
        Mon, 12 Oct 2026 06:32:46 -0700 (PDT)
X-Received: by 2002:a05:7300:80c6:b0:351:78a5:d0b5 with SMTP id 5a478bee46e88-3537deccadfmr18827397eec.3.1791811966021;
        Mon, 12 Oct 2026 06:32:46 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca1b556sm44740397eec.9.2026.10.12.06.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:32:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 19:02:11 +0530
Subject: [PATCH v2 01/13] dt-bindings: phy: qcom,edp-phy: Add DP PHY
 compatible for Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-nord-drv-dt-v2-1-a2ab9af954d2@oss.qualcomm.com>
References: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
In-Reply-To: <20261012-nord-drv-dt-v2-0-a2ab9af954d2@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791811948; l=1293;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=GiBsZdkB5tHmSr9H8+rZ9GhQGrutXqFsjreZo5qOWtM=;
 b=2jqbWGPiUAdhEyigTemYqx2Mb/1LyGB9Ffl9QJSWT2YL0+kTzRvkvtCImVXPlEp9PW2I+kVrB
 oZPceZ9ki6aCBZT19uqSdq/JvEF5pIa9NU58HRL2f10qbkuIf/jVGpm
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfX51tdbLZCZnB+
 eG6WLyZNoN3qqQBsAZC7lmOlU4WSV9NWKPTY22gbNDyH/rqzdXECj8Gh6FVwyvWtcNvtXc5FbNI
 iUS0Xm/o38QXRdiahoH0Uc+wRpDJFEqdpwn9S6BduQ2XaqY8ZbxuNNyK95aixj5ll6i+jl2jRTH
 0e4IkrOOVjKpAQctQcX2z27KKV+6i3HQ+bugh8NVY2ku3Khd/XDnleU7+GIY6JBGv3InOXyD40p
 /RWH/jez/AQEKFc/ZbQHHFKQ1mzzP3DoVmlAp7qi6ME+hc1uTt4mcac+GkISgpvOtj79unR5pH/
 t3A08AkoF6422e4/eBcualS8wQWXxe1v22S4CKabmHLkG9wb1WDzvIUodaRV8/cd6oxXdd5V1fr
 MLC0O8YQa31ePIZ8J2QjfyBpoDLNweseW1oye7567IatjX6J5DvNxcWFXhlwlvcBpA0bWYBPMn5
 Dl8Mn7UFJJJiiK3m2pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MyBTYWx0ZWRfXzc2fwmgEvFnI
 qHhAGddxyBDvnJVUSED5kqSbj/ENE7EpU4P5e9IQmd7hwsqokgCCgyF9nbNh0Y5pQSknofAeLiB
 qwZR2OXBcASISwHaIFtmCpoQwU7PfzA=
X-Authority-Analysis: v=2.4 cv=VOtIDNPX c=1 sm=1 tr=0 ts=6acce17f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=kfPMoZk3nD7OVdbVor8A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: 7lsc7f4YWxTPtWeNEec0cj8evJLlOZiM
X-Proofpoint-ORIG-GUID: 7lsc7f4YWxTPtWeNEec0cj8evJLlOZiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 phishscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120053

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord relocates several PHY/QSERDES registers relative to existing
SoCs, so it cannot reuse an existing compatible. Add qcom,nord-dp-phy
to the compatible list. Nord also needs a dedicated ref clock besides
aux and cfg_ahb, so add it to the allOf condition that requires
three clocks (aux, cfg_ahb, ref).

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
index 0bf8bf4f66ac..0ff07ddcb76f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dp-phy
+          - qcom,nord-dp-phy
           - qcom,sa8775p-edp-phy
           - qcom,sc7280-edp-phy
           - qcom,sc8180x-edp-phy
@@ -74,6 +75,7 @@ allOf:
         compatible:
           enum:
             - qcom,glymur-dp-phy
+            - qcom,nord-dp-phy
             - qcom,sa8775p-edp-phy
             - qcom,x1e80100-dp-phy
     then:

-- 
2.34.1

