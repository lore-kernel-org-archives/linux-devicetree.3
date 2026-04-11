Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1225352C34
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775909456; cv=none; b=QvBmZ23OFVHV5ZafeS+gUXtZl4B9pXKmGakjXR0n0DRhZybMs4g14S+TaTMv/4qzqUhLdDWoy8yiYPr4QOqJk8F4vMEpY5tnO4aebSakfxKnIxWRwrtP1duXY1nI32pwpwIxoixfhlc4ggExFKJw+fYobneCRpRWl8Xn+vAn1BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775909456; c=relaxed/simple;
	bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gJemXEj/g1ManOnth/HCWa9wAXSqWxIpf7UwwHhKnZz+GSQEgwWtdCTv68VKLSByuHgPhfjwVKCMqG1hRF42AQTwscCBdl5Dgmloe/zD+eecwRkcmvSZsOJgeEHVYBWp7lJup63WTr7hR92+729htJdxkL1nIO8/okVm7yog7FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dy3MeANw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b1m3vrvK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dy3MeANw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b1m3vrvK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B403pn3909437
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=; b=dy3MeANw3hI3AbSb
	fcYONsxn2v6I/PqrtBboINr2TWxkwyRT7QsFD8LtH8pjh3OM4Wvn75kxhhDTQDQn
	P/vmvAePHAqwc07LnF19dfXvqBQMvXEmWT9ws/0A8jw33CAjiifDBt/L2MlzLFVw
	MPT2ER9ugugYJKdDXinSx61OUzLGa1idxSBeA8PokjwyIxqAaFh4Ldum3jhU9RmT
	bB1NTaA9wrR3fVBckibOdxW2jImPCw91eFQwHzUvemv5utmFSzHH/KM9QxatBmpC
	S6hzRHiX+0cAngD17aXNTHIvsLwQoA2Wp6qasE9PC5bQwEsaGEdtkX7oURtQdUnO
	GKBiBQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfew00na9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 12:10:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8e8c47a3so25124691cf.0
        for <devicetree@vger.kernel.org>; Sat, 11 Apr 2026 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775909453; x=1776514253; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=b1m3vrvK5bHcCGa96F621TWERXuCOv6mPR4sSsAHajPCEczqvDjTvbySSAcSmoYOOh
         UIq/b9Whl9mGGRkTqSkD6hs+LuxhpApBg95kQj3Cq0lJzT8YCROmJV3jD2tM0nnU5oJa
         CVvb4s9UHHC3EA2s/t0Vzm5wrIzsI3RBd95bzVB9xyrTd+OhukREA8RFwhGrEKbDZ+H/
         FvRIL84ITrLkNHLzxTgJX+v/sRKepzSNBhvWvM0MkKJiiNwXq4ZHlH3EvgMmkwJ+yy9A
         YYeEJ1vii6daIkcp5R5GWefPRnJLkLBozCC/Vub/MW+W+MGC+Un8yPBtyPx1i8iQ51XQ
         gJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775909453; x=1776514253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EJIKpujoigVEaBknrd4/meAnaGYzGS9Xs4bjoKjmIO8=;
        b=YZiGAbSLlz2qJ9aho16D5ub2FyGdMulOtlbReFmP/E5VBVdSmnEKro2JdY/OHvfehy
         hA+gLE4MelQ6L7P6uZvzCGqslg8tmf+ulG9utvoGNdryMj8ZL1uW8odQd1fJZwyeGCS7
         pCWEieNxbJRH4q4fY0FwliMzepHBvDvmv63WIcEz/Xg8uSPhC5yyIIKar67CQA0aGNnb
         Tf3y+FjVgIkDmnGuVm5t3nMqFmZcYWpqIJrDHQeERmYqcUcndh5+0njzzJlHqY30wyZY
         DUZURJv2pzDXd+rAwK6SAnViyMsWUDQdf5GiI9n+b+oO7zeoEjZhpJlg+XVa4mpXO0Iv
         ielw==
X-Forwarded-Encrypted: i=1; AJvYcCV7AG/Co7ddtIuNFZnuqIwNVUE0sYI/QduelMFIp9VS35l9C+P4Xnfuq5LBAFnrnjYmnOJa1/0GzP+w@vger.kernel.org
X-Gm-Message-State: AOJu0Yxhv/MW4dNkNUjSL+XfKjgEHoVyOTHXKeCA5kzQxjoqpPNrjiu6
	fFxLsEBVqKbqup/dHL10wj12cdNS/lXUAtY+k3lPyJyrQ4MzDmmTqVD4gGFVHW9Fxcek7BRMp+w
	xVZ9eQ2TSbIoASFMImyeF20M6FeDlINeHoWiDr0xjgVvyFigmp1ZKZTf/p9TO0DQK
X-Gm-Gg: AeBDietKxNk6OjyidFwBeN3CnuJ3f6HwbL9huLlE2ts+8juo9NVVadACgDaFx5/Nd8A
	ro8GlQzIQSTYZGCAizHPpYkxTHTT1YdkDF7HL8OHeSsjEmh6Gf3jHy5+AyyF5rUyWarlgwiuNto
	BcbvGmacKGh52aUVLiEixoml2AKtArJ5uLozD8r8clB5L6ILft+jiDFjN5de1clMGruuULj4tuf
	INeUANZJq9ygVJARHwRKgGVS6qE263mqcFl33FJv9qYRGR4AzKPWGJFFtmWHfwltFNxyh0TzoVu
	YKcn/Xy4Aa8ikn5i3HY2Mdw0DQapGZeRcbhU23PkSyzFCZqwgkha63sEsj7zD5tUyEGCRNZUSsJ
	khFTtTCmUf8EthktWJS51cdu5fWjWXUabqV5BHd2jVBn8bWRyhneFP4QsBnV4Sb/Bgq87wtQWS3
	sCv1UfGIW2u+yDgDQ5NAgq6IA/UDSJGEvIkEs=
X-Received: by 2002:ac8:590a:0:b0:50b:4537:2e21 with SMTP id d75a77b69052e-50dd5c10684mr97349261cf.45.1775909453447;
        Sat, 11 Apr 2026 05:10:53 -0700 (PDT)
X-Received: by 2002:ac8:590a:0:b0:50b:4537:2e21 with SMTP id d75a77b69052e-50dd5c10684mr97348571cf.45.1775909452897;
        Sat, 11 Apr 2026 05:10:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495b4e73sm11906291fa.41.2026.04.11.05.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 05:10:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 15:10:22 +0300
Subject: [PATCH v2 02/21] dt-bindings: display/panel: himax,hx8394:
 describe Waveshare panel
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-waveshare-dsi-touch-v2-2-75cdbeac5156@oss.qualcomm.com>
References: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
In-Reply-To: <20260411-waveshare-dsi-touch-v2-0-75cdbeac5156@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
        Ondrej Jirman <megi@xff.cz>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Jagan Teki <jagan@edgeble.ai>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=b6lJFQy4133z0QDWI8Z8xZQHGNeBu8+YH/BZ7Z2AGmc=;
 b=owEBbAGT/pANAwAKAYs8ij4CKSjVAcsmYgBp2jpEcItG6KM6cL2R/Xo5i5wx+vf7QMNN5yAHq
 4hBuRPZ3MKJATIEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCado6RAAKCRCLPIo+Aiko
 1U5yB/dePBkcIcpr6fn0iGCcsez44HsTKognR53WcdondMJIJDoCJ5fvEllYXUxOm7kLDrL9NtH
 MHbH6HmbUAGNMN8N3qgYZ8pFBktNKhqzU+7DMHoikwFcPNxc+UZOsxB5sGJ/wTi5S1TAPI24l6M
 lxVfJF9e1/9QZOA1Q0C4xLXPm/7wxOcNtG66VhjjTPh1fmtJdcrHcET61wHs3MayTcUkfW3Nke5
 K+FwQ5jSPCIpqQHoVaD83SGFCAfE+iL0slowEETtY/PrOehYA1jMthgcFVDfuz2FQuSFb/b3yPx
 NijpdzfYJdmRR1Fhe2JhHfy0/prsK/0HM/0QQ5D4z5EKX0Q=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEwMiBTYWx0ZWRfX8F4qplYr3MKr
 QWnLLnE6ChHxCMO4Cj8Lg9jqdotJ5XA7tTgt6wFSHVHqjPG/RywK0vh3tKCil7KEnQqgPs/swTQ
 W9fp7FTamOA+wS3RnAgLw2qsnsE9uRCxUmLenOTgupAiDdD+Wl0H6F+J4MiIyLWUkExbY50hP0c
 TZkz1mttcc9V//aai96NzSanE1iwBEVeDS1CgrqEsPqJqBmeXlXbBMpexuuuN/jFxPq7IkRvtVU
 g7WhDXRSBncfw5B7pzeNbx9px1tazs1sk2seGeTHWJw3ipZWaYddSzQRmyM0vws8tgxhaPodbc4
 /7eN+nCeLrGIwIqev4wu8hRqYGs2gt09BE7Js0HbHsbJZhZAop+LzZJUvRBPc1Brn+Ub8Qu/8lm
 maHas3LMUlg81Sk5M6EQqwaGaFYJWfer4GmuSu7yBuccwVsw1+F5lSj2LxgV0HtRe4uKyN75OKr
 EZ/96pJm+x8kmJAUm1w==
X-Proofpoint-GUID: nzdt-bRmC-fDLUvMbA3E2Wp6vHXR9NHv
X-Authority-Analysis: v=2.4 cv=AofeGu9P c=1 sm=1 tr=0 ts=69da3a4e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=0AHfZW8JlnlOAyLNbMwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: nzdt-bRmC-fDLUvMbA3E2Wp6vHXR9NHv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110102

Describe Waveshare 5" and 5" DSI panels which use HX9365-E as a panel
controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
index 84e840e0224f..83c343b02835 100644
--- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
+++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
@@ -23,6 +23,8 @@ properties:
               - hannstar,hsd060bhw4
               - microchip,ac40t08a-mipi-panel
               - powkiddy,x55-panel
+              - waveshare,5.0-dsi-touch-a
+              - waveshare,5.5-dsi-touch-a
           - const: himax,hx8394
       - items:
           - enum:

-- 
2.47.3

