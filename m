Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835049;
	b=WTQRHb9eaAvCVLdVjY81i3Q83vX0KdANMz0PN3J42SpRgJJgoj9/l7Elc+q2Mg5Oeqtq
	 gsL0Ht2qKqWQcc6ajBhwUxEYug6A9BD4gqVMO4fLBSQS3T2hf0rbK7RGJy3gt2RQIVMYT
	 ZpBEWFHkve0C5SJNbtOC4dtvcLO14ykGzbe4m41Uj9SuWtjw5eeJH+T3RqSI+M2BBYZLq
	 pcQb+y+SJESpfREdu96siHl0Iu5G0+UPeIAfPOopetw2wmn1t9Rgj2/ZTCHE4zI9cpgh0
	 DvQUzKuQOCI59jcRRsLFY3u8LPYlWZUClR9ccqMlfw0mg1eMtCx/IFCUQonmZyDuoZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
	b=MYaQxhfBYsn80WmfU6afl3y93ZK+4VY9s5G2mRXjiD5lQKl7vqNxyLVubyshB0WBd5wX
	 dyoR2wpjD2j7INad3+CUfZb7X4K9v0u5Jfu0rt7nSIAqSH93/Z1MZTWn6/BcX2XcW16Wz
	 H+pQlJvU/Wg0qRT8HqzbqCC3LWZGYbAzN6dGUb3WWORNm+21htV1z6+WQIjse2mimu1BA
	 1VOCwHk5cK9B/9RIWdZ1aq4zWTERtJb2A8O6yASBLx9Xfr9YumrXBWEW+TmjhdDY09YD7
	 GdtIBvgFhHnUCwH87TRnp31Z6aa2m8PW9B4QtzKglHWjcXSj5M6AK0ja7jaftcLvYcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjgWI7YI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQ9tHAwi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8385606A32A
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8385606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjgWI7YI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DQ9tHAwi
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC12HJ1482979
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=; b=QjgWI7YIpdtgeP0n
	w5Tkt6XKngbzdR+lvg+gkpmH2poPymIDAu/Nxg6f259SLON41kBrIbBRLpC6pqtB
	DkGBx0jdXV7lMP76y2/MF/I/K4HfuhQdzfNGgixDcOV6lSQUX/SniloQgerVi9OR
	OIOqXpzuLI0xKHxyovsPT4Xo6SyzCF2GEQZxm0LfV7+iSs7iBdyc5qsaoB8Ufje7
	cNULvOMVcUPquoVRD0zft+01AhTCpM6Q1M2wf1/k7oLwWEP3F+nk2DG2k5kYPWq9
	C4RSiHSZyZLWaAKY4JQU8S+l3h2IxxtTb+ZVIyjPaX5GPHW+bthV/YCJIsk4Gdw+
	myH4YQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyrqgnjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 13:17:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f20addba1so650593285a.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 05:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835047; x=1795439847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
        b=DQ9tHAwiQ5VPLDr7ycd/81zrL7AwqkhcvOU5+g3lm8sIfZ24a+FXUo7wg5BzxgbxnT
         6QNOlWwhskv2kHL3BJFHkFTnYHmbUlncXmf0vC07zPhafu5dYxXznlBK3mq9Mfd9Jy6P
         a/FCVaK5rS5TzlkaZumhPBdoh0PRRP8kLG3CAY5QA/UM9a2FkVkcyoPcQPLFMpwkHJSt
         RW+dw4g1hlf6m9g4RbtpHRi7ceETbXYv7AHO/RSRKJlxC797z8OKmnH4+tm0y8i8CpGO
         k3NtQPfWO85kXquk2pURHaJMk13NYk5t2QAjzEY7Qn8uk5nfHhorNMOuKi+ZfZ9kQtCY
         Y2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835047; x=1795439847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjqYFlsGYQ1BQRZcmH5d7N4ve510rUSjekhHGgLagxw=;
        b=KrUjPDTeYppGdI0cSMnAlQ8Sgkcaamlq5mL2SqO4K5anB2dbpd9E+DwGsLL8PRXX4d
         APcI3H5TpVVJndBujaut5df+flYQLaEC1I/pEGvHErQUSwe1ErrAIrbf2ZI1aSwoxzH5
         mqpI9ldkML1f+C57ukKfhN/WJkD5x1AcIVWTeZY4Gcf9c3zK9WGf9ZXZERa74pgMX0QY
         Ae1l3LhkZFMUMcVyFg7X5HYWExiVdhPze2diLbsBEPk8ZiztUjW3kjP2Q3Ozqg0VT7Ex
         ToVqjI+3WPXWdASyOFvRK9dFgYTJ5vbzWrFpWikh+UNhiwqb8icKCuZXvIxSKsG/3v/0
         4DoQ==
X-Forwarded-Encrypted: i=1; AL+hErF3Ges3ScgIoV20bIunuS0Qkpc93UaqE1LEUu25eBTKxVXX9leLCVc6biZsVrJBOe0gjnF4uGEvgSah@vger.kernel.org
X-Gm-Message-State: APuU4Z9AGmyuPB9jXZqJkMiSCIV1ouPAwvOZQSaqxHzY4DRGOVogO9G8
	m3AYj23c6qahm7NRIoWhRhV+lvfk9xjvYZuNY6JCv9/s37vrJ75hrzBkhcVEB1xvmDLZGkDfNcS
	CWOdwA92Rb2PVHcBBCkiVljSOJYvcrz5wM/dD98RrjonGHiPnbf/YCw55QTdfDhsv
X-Gm-Gg: AYBFou3ZLQzkFcVBuNuNbE3JbFgy59B0Lf/jZqBErhKvJ2ncNE2k1VUQlKJTP9LnA+Q
	jXuYy2I99eQq+ZDc9PjJILLB0agcRLOYPSlHHqBMl9Q3doNyZnXuEhIlZRssv/7uIjRjn3oEklE
	dhtcHY///7G/bNzU4TsmZWByiT6LA38bOXHBuwLrgltpVfxdDiKTVdC1R0lbJMeVzvwZbQWYjVU
	2aVwJG3AUyRdHfXXpFnDS1YCmcFHZq1VF+GiStjQGPQS5/kbekOxq86ECvSad6o3IBeZAIiL/1L
	/V5ykTg53e2tRJ9q1VNliGzewwxLmHMLDd+NFwksnL00SprM6IpbOtyslRgBx2bUhuhOGrHPyIx
	ZVEax0Q4DiRHtvMWfTaxa4+F9KqFnopFDpV5rsWyPW92r8oI0IL/V8qS4uFTrRfDzcXdD/qAi16
	vA
X-Received: by 2002:a05:620a:3915:b0:949:7572:e76f with SMTP id af79cd13be357-9497572eb07mr622418785a.46.1794835047010;
        Mon, 16 Nov 2026 05:17:27 -0800 (PST)
X-Received: by 2002:a05:620a:3915:b0:949:7572:e76f with SMTP id af79cd13be357-9497572eb07mr622412185a.46.1794835046441;
        Mon, 16 Nov 2026 05:17:26 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8e1c94sm843927285a.39.2026.11.16.05.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:17:26 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:46:41 +0530
Subject: [PATCH v3 02/11] dt-bindings: display: msm: dp-controller:
 Document Nord DisplayPort Controller
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
Message-Id: <20261116-nord-drv-dt-v3-2-e3d3bf0e2c49@oss.qualcomm.com>
References: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
In-Reply-To: <20261116-nord-drv-dt-v3-0-e3d3bf0e2c49@oss.qualcomm.com>
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
Cc: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835013; l=910;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=nRlWeo6qwZpE3h30qNK372PqbYIGf1MFndG0VIRsKqc=;
 b=i6ITwZfY21YuZyrTMvYWrpTI+9AHfbQ5K3aBNJlABaLA9eT/NNIL0fXWuALzmd8XnCtpQd0ZR
 F2hraEx6/IlBVnXX/+Dn0+ng9V4wOg1HwNGpnrt86PAM/eN7YQy/6/E
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=VcJir1p9 c=1 sm=1 tr=0 ts=6afb0268 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lCWEfuFUYIIHy-HYLagA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: iDCUmytcYwuX3eBNGN7YKh5D_I5zihpA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX/WNE08FSPOGU
 T62AumgZRURbKrgJcHb+qUq5dgesgpZNGsKshyDKUKA0APzXqHGAMUnV7BQOd/fww33Qn90abGr
 VBWdsuCkh7oxjUxh14fpeA3v3WSvN+FIuQugpDrD4TMGZ5YsXL1sfXrA/NJIC4DsXaJ6+kXGmdy
 MCrJKVoXsq/BWZWt7qSpE+emR1qqf9L38U27LgY88soc3Irwqk7rTbFpAUvHrALO66gMLjooe/C
 xDOjxAWYealqYTjPVs3oiuT5OprbnByanu9C7pclNU4oGr47DMinfKIJCnkTWsQIYrldAub/jL4
 hVHtNmzNCvdBi7eNgtekPtUuAvAnGixuSw6/qtz+x+GQ5jCDD8FXN/d1fKvkxidIt0TX/3g0qiv
 HyLMivX5FE2Jj0eos7xHk2o/fKoDNTz2ezCfnmsa2QDfKyZyefigckQfACBz+S108i1CNKlDx2E
 0no/PCukTexjV71FjCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MiBTYWx0ZWRfX8kshdLhm+qT+
 K4iAvD431eNfFmczJ6HBQWkeXtXVFP7iIDasqQ01KbMvQ0N3VZB/9k+RUNqO8QNmfYp2kLisapN
 RyIfKQBNB+0GvSyuBubzmt7KhrwlgNE=
X-Proofpoint-GUID: iDCUmytcYwuX3eBNGN7YKh5D_I5zihpA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160052

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Nord's DP controller is compatible with SA8775P in terms of register
layout and clocks. Add qcom,nord-dp to the sa8775p-dp fallback group.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 094a6383bb77..9be0288261e7 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -35,6 +35,7 @@ properties:
       - items:
           - enum:
               - qcom,qcs8300-dp
+              - qcom,nord-dp
           - const: qcom,sa8775p-dp
 
       - items:

-- 
2.34.1

