Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 798B22FE58C
	for <devicetree@vger.kernel.org>; Sun,  5 Apr 2026 14:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775399657; cv=none; b=ZI9YuSuFepkScYRvlG38IAOX377FlSX/iNZjw5SupixU7wpdZhpg0YMIi2TlqHT0JG2GC15U14At9ew82yLXdQDBhFLuDoxG+lrD5KL0Lp9l/NLEbJv7sG0+xlwKF+in33sW9pWhsu+t3lN/m0RJX8THgyJQePHdZQZp3dX2P9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775399657; c=relaxed/simple;
	bh=CvKONcYc3T9TBfcvhreqtjqGKG2psNVzlnhXVdP3IcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TjMCD2q3A6zZgj4wNzyG6eXHjIz1wm6oAjZa4LJoeC3JrUP6egh8ktbpoQJ1bUXNFp2jwNpamcN1Ter+U4yIWmRS85jT9wHeZilgI/ZoUVzkci5oiauq8wlpH5mzoXf/FRGJVgoBQ3twJ6htIixHBE0Q3BH/iouotA9AXfALts4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i5J+werD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=brBYhGt7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5J+werD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="brBYhGt7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6353fiZS2394711
	for <devicetree@vger.kernel.org>; Sun, 5 Apr 2026 14:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GA1/QUGFfB74DpxbTaloTa6Wd+eev5cFwBe9u7pq0Sk=; b=i5J+werDIA01YplN
	4vJu036+W9qJCVEmhfFFabA4Dq2nL1LD1vkVCBHBJZG6IdLGd6p+opPhCQ0nDx7y
	qCTOlzqzuZ9X/KVIW2PZba9Exd6fAFwqQwFs1pDpLCAIJbPDgvIALKrMWSIhAA6Z
	oAu1J+y/ul9kR0Llgt7icJMAEIZcZFspsccyIPl5LIDRlMhjC7Z6sKegP5De2W4e
	QhckeYO9Odnh3VmIBTwoc3xYwwSK2nb0hmypiXeTePEnUqdZFhQoiNDJ1olfzJhy
	96sK4bQUe96IumqId5nMlWO2P9cqNaehQJjx/pchWNIjJocGxoN9m4kyVe3zE81R
	lIr4KQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datqsjjkd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 14:34:14 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso29024291cf.1
        for <devicetree@vger.kernel.org>; Sun, 05 Apr 2026 07:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775399654; x=1776004454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GA1/QUGFfB74DpxbTaloTa6Wd+eev5cFwBe9u7pq0Sk=;
        b=brBYhGt77RMk9CVITCoZSdEd8+sP0waiqcwkbL7Q5ob9RSsqjrbp9uzgN9huZVyFgJ
         l6U0aImkmZmHLvNyzaR0jWl52cwuXzakQqHOqIy7EPbFVclp0TKCs2YFuWvanFJe5nsA
         78+HmR65x451Me7BYH4ofx9SMdE6ZyT+79wb/zZYqjXl4tYla0no+oMF4W1rypXDCM17
         LiDOe9Wwdlzb5mZiaGPu+S9AcO1oYTcLE9Y/HglSAhBfMof6z6POVj5TFQOUcIHoKlUP
         G5/F8AgLGNTVLvryw6mjdn/hJbWMgLfne8EHJmGaopdfKAmirjdVk06bkY9qW9GlGMi1
         xKFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775399654; x=1776004454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GA1/QUGFfB74DpxbTaloTa6Wd+eev5cFwBe9u7pq0Sk=;
        b=mIX6ktZ+K4+lBtFugv0ZwtyUGdmLpZDB3E/655MxdJsEIhkFkBCK1YhKdi25OEZ9WA
         kr5Xfap4OCXISmHrWYMqY02LXblBAER+pU0SMPOH7Q7AhWj/5ojgVJQm1sEpOuHrvpWB
         BFMSeoCIB3d5wgBg1ZrARdGIOA2cthN91nrGyeXTjekYoCMfGA7D1c0CadVatBgJcAyX
         CHooeAiI5xTXeHa6Bg/nLvqPkSPZPp3qfluKEd+wNIh023iX4WW83w7oNbAjnoBDzE60
         Gki4Ja/zZe0EJO8FlppluVvVGGBSTExmfrJp1RGItw5iSoGXP3nXITOb1rb4oYQm/51i
         s2mw==
X-Forwarded-Encrypted: i=1; AJvYcCWxQtIgf/HHDRv7LS21TgqvpHd6psP7FryS2Wkizk28x8oIe4oqukHdQHqpS9BcSpzuz/ICz5RwPB5L@vger.kernel.org
X-Gm-Message-State: AOJu0YwVwRK/W0XhysJiwyeFD0XFxSAoNIDGj8Rsvi7PUr+w5UH1H0Xj
	l49XbZqondyXdHzv2dUgfgiYJTiNot5X+7NCAZGsaH5wauQcp9INmW+tG5D3v9/NeRhvjkIGN7k
	H9NPYeaHMn/4W1polbdvUxx8IC34B0PpUpzi12AzlGEwtMc5IUFMw2TSCBo74ownp
X-Gm-Gg: AeBDieubB0oESPvzZryBpCNBLIsJM73zL9WM+DScQi8A+8rtWqffBjeBQYY9PpOuF3c
	y7eU3oLO8PyBVZpnkwcpJTfeaiMpuNOKD6ggzha+aZt/4yBLp2jnfjUCTZhcrZUcrUYmKITiyLV
	Ppruev+NXqiSfZdGbIXI0gpR6I2/SOB7aeVz5ZAuwBoD9Z16IRiphc4JdOQzcdVaQQvScSca2g7
	OTdSe3NEwS7bP7j2v8i3/cAtzV1YdN1/kpTcwSN7oMfwAPhnh60T6ZhxGKsjEtRqguZM5TAtkkO
	obWFJe4o0y+r9yAiWTIDhAZmzzvqwXHd/dCFHdDg6UWRbPCVRYTs/f59aQCvlFsN9zoo8awCbyP
	PL6vMfwX80tDvXL+DIFYDkSq2obGszaqSLk5QuyfgVZKH
X-Received: by 2002:ad4:5c44:0:b0:89a:b0c:7268 with SMTP id 6a1803df08f44-8a705782443mr179550636d6.54.1775399653913;
        Sun, 05 Apr 2026 07:34:13 -0700 (PDT)
X-Received: by 2002:ad4:5c44:0:b0:89a:b0c:7268 with SMTP id 6a1803df08f44-8a705782443mr179550216d6.54.1775399653486;
        Sun, 05 Apr 2026 07:34:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a616sm713934755e9.2.2026.04.05.07.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 07:34:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Sun, 05 Apr 2026 16:33:58 +0200
Subject: [PATCH v2 2/8] dt-bindings: display/msm: dp-controller: Allow DAI
 on SM8650 and others
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-dts-qcom-display-regs-v2-2-34f4024c65dc@oss.qualcomm.com>
References: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
In-Reply-To: <20260405-dts-qcom-display-regs-v2-0-34f4024c65dc@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1358;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CvKONcYc3T9TBfcvhreqtjqGKG2psNVzlnhXVdP3IcQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0nLY7kqLZOcOyLvz5MUeRl9v9KcYPi2karLV2
 1odhQ5SX5uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadJy2AAKCRDBN2bmhouD
 1zpkD/9cLZdzdR2wejfgCfDafYVz9UCCz7q6Ax5+8Z7MmiLsLVG1weEuq9lRNLBfbwKEBgVdgwO
 HCLqhpe9kODY4ulkshyPT0IHP5i+cCQ7LeXSvIMcGd1pAKMFbfgqUnUmtFX1mj6WfCmpj35JZu2
 6Bo3huIAzBB5G/P7jylmqjrSVFgk9894yj1HjjSz2uDOs873Z9st11AGMU5wDaxQZqkOuYO/YrL
 loOWKdI0V5dYkO+PUMHKfaPKzByEV3D9ypXuQ9l7GAvhUejbgBUysmIhNWmlvOIVLwurdxQfuWs
 jEFr/QElDvDRORlKda2HxrMUIlSPagZfc3Fic3ir3dGVNDZDqxYzUTTIqGZJfkabhjL1KgFqW+1
 uXrpSwQl4dJTbST/jpGMn+2b+j704aJ53tHyqTleOLtpBZZtWlNTk29pT5pZ6DxydB51o686Uq8
 7vHr7k18d5OyG7s8KDzW+YeyIVHUh3bi4gP1JUuHIriua2h5gOnMslOoJPJvil0fdBAehTzY6xR
 wQN0SIV4Gvubc0il4QkPEV/f3wswqmSX92DnWTkRo2t6oUwtWM6eXjAAv06EpW0MDh4grNdXbzS
 GFgFwjbB4u2Hi+vr8PBHebWXb6pnYjEpz9sFeVObpTR/qBu403x4rG48E3cUQQJJdvoL+zGsG7Q
 7NUThZZsXjGUsvQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=ari/yCZV c=1 sm=1 tr=0 ts=69d272e6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=9q4-ovLXei0DaHkVYC4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: aP_pxrOsPJuVwYr9l_vyH0epvsyr0zKN
X-Proofpoint-GUID: aP_pxrOsPJuVwYr9l_vyH0epvsyr0zKN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA1MDE1MSBTYWx0ZWRfX1X4kntpyOg88
 molMGXWcvMEKfcS3o9QOpQ6mdaVUtwi37EGivm7dr1yCVgIQTIWYudxwKX1v8DXQJ+zKLwOfLBw
 x4zN244XRMQLH8RtWjjxl09ZFi9qaOlJrBG05IzwnUePUwU9RLLB/eQnZ0QFd0qO6Vm5gAz0guV
 K6QkmEw93barhILwWNNvk6tVxWDtMz3jfJc7WBEMnNB1zgeRBiZsBhINlcLDo42Ir+FkLftXEAw
 ebCqMlANi2XzW1Og4hE33ig+BZFZ5TdcaTZAYWRewPKV9UadJFThyYQVvw/vgE4AULwO8DzwIvQ
 Jy+8K2j0xqUbf644KqvkxXKVhx8tWeEhzRyYYdtql6O8v5tqJ0Iy5iYiOCeOmqihViNn6SmQV2E
 wtddcS+zCucLrv1vZuvTuxB2kMfG/TdnFjLbRF1HDQ64MUjR3bE1c9W307hwZo6KvV4kV4wJvrJ
 cAxILXJCjRZfivVQe5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-05_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604050151

DisplayPort on Qualcomm SoCs like SM8650 and compatible SM8750 supports
audio and there is already DTS having cells and sound-name-prefix.  The
"else:" clause for non-EDP and non-aux-bus cases already requires
'#sound-dai-cells', so it should actually reference the dai-common.yaml
for other properties, as pointed out by dtbs_check warnings like:

  sm8650-hdk-display-card-rear-camera-card.dtb:
    displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Changes in v2:
1. Add dai-common.yaml reference (Dmitry)
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index e4f17d29343b..b96e1ea40d3f 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -219,6 +219,7 @@ allOf:
           - required:
               - "#sound-dai-cells"
       else:
+        $ref: /schemas/sound/dai-common.yaml#
         properties:
           aux-bus: false
         required:

-- 
2.51.0

