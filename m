Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777A13DE431
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 15:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910024; cv=none; b=UBYkw1j/HlavPexk7WyYNJLZwkB5EAUBx9zXx13Kqzm8XH4+ljOaokGKw4lBuBju50gHEN79sdMsez+UjAK9M6OX7uo8K/lvwDBDsUcePF5KsSIyy98QCBLB+B9TG9joIKWkMoEWxFYnrcoDe2iHsAH1zz8f4u6jYAuHBGmAxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910024; c=relaxed/simple;
	bh=dg+jLLgr5vkef5Es9bMvn8ytADX9HeTxdUtAAZwm1dE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gIOVRONg3m4QgbZpLfGdLF12Ce0rbBJsNp0GzZGNMPKGc+z7cpMVY6+Qkr4ADVg07IZe1sWRHQpx21JDBXNI8BJZtTgHvJNJF8pITWxEzTNUq38VJHhl0f6sy3CV5iKxy+fmkqoJGmiztc3/SfQFWBh6RfJ7grCdC4Tix1NgJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T3Z90JUn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Aj6+JfBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T3Z90JUn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Aj6+JfBo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B4AdO4128680
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 15:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WF/V7sg4uI7nycWvm2M6o2
	Yc1bS1U076/rwa/8lCuZ8=; b=T3Z90JUngfY4NNVZmN0y71BpFhlvC1W82vc3xJ
	rHlkW97G/fQ0mS76+C1dfbyWvGfBlZHhAvBE29C9197QU+RKasPotiLwfBbWXk3+
	yktDp5C2O5zWigtY8B9ZZZwOIY9RTOu1wko48mRSeiUHyDdhEM99BRwX5mrpAAVH
	zmIhG3x/PvR5fkxudLbjRSbEX5IuW0oZpZNY3mqzaO5G5mq5g6+EjSn94YRBK6my
	2b8QaKZDQcKpijsEuN0TwB61OeIW+/o9a8hIktnaQaxis38n2cqw62AI8c9SVXPi
	qRa5WGo1tclyhO4AX3XC7oVpkYE7fXMrcefC1ARjQdh7w01A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxsdw14gv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 15:53:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50df4c130dbso127564481cf.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 08:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777910021; x=1778514821; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WF/V7sg4uI7nycWvm2M6o2Yc1bS1U076/rwa/8lCuZ8=;
        b=Aj6+JfBob9IzTTujBE3PgvLDmRw8iYCGcWrqvuSRDIvKyi3UfOjHX3yBicgMgMkbyE
         HRzogXu2OQNeV47A4ZjMbZ50ryWT0lga02n6yietDaX+FYlE9V/4WERkrn9rrWWig0tL
         CISPlkcMpaK4TDhRAxKG24EmIe5z0oGFAUolB0c8G8DQRAImEK75/U/IXl4KorOOYoIM
         Fql+2jdpS0axsKHmjRMJ8vYWEKeolGy9U/o3kHbSexzYY6TaPl5CFxTypvLiUUHOnBJ3
         39uV5SS14FsOhzCnS0zU5nH9gw2+gqx17DXofKLJg6cTde9kxvk245pJKddaEMc/H5Pk
         dvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910021; x=1778514821;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WF/V7sg4uI7nycWvm2M6o2Yc1bS1U076/rwa/8lCuZ8=;
        b=r/IorPT58cw/LwAeTyXOpJkQoVHA/5pauu35GjyFqbhIJnnFbK2tcruGEU76WuXToi
         cTySB+4dAciiJzXJcATg0cKtosg30AZhHAFkbs3jHFXMm49EcrXK9kCjXoV/QZYLfdA9
         bCL3w7IZA9mBM5I3RdQsGkc+a6Gki1miGHK28RwPAiZamF0CHDIn8aKEpRzscAXtGLdC
         olkJmiYDArK57YLPPvFpIYSg1/IyzDMoTSVZHVNNgJjkY2mGCzvlkrbo9g34yy8Xykae
         bXFvDmFmWx9OFkBxgls48Out6CFEZPe2yHDgjU3Tf7J/FjebipJTKzEbm5p3ek7i55DA
         jOsQ==
X-Forwarded-Encrypted: i=1; AFNElJ8ZEj5aHtbhcdutCnRuOBxiYq1Rz0E9kyoKuy/IWkNGAmFo9k0TGyDpcO0yw4SmirfH/Yn5OXhJGiik@vger.kernel.org
X-Gm-Message-State: AOJu0YzabTrujX53aR5/CxI0wn8HP9vOwsvOAErtmDGh6viubO1zmJQs
	37gJ45dH08KVejdVy4s+5DjDvXFIU259+jei9/JzmOZcfkmmsNQertiUOSfyGFJN9DX4lYhbYcX
	pW3dGENoxJqcz2zrZ/GMFzuiPcHMQzhqf64+/Qh9HPaA10f0sELOllDAtfN8scqp3Tbfw1N+/
X-Gm-Gg: AeBDieukZFrfzX9ny1ZGYZW/nk87mS+e6/rd8ypEtfDYbTjXFDeTp0SbujVuMi9Um/J
	yrmC3BIsITSC4nBCOfQ7qMv6XtUxNvxq+2C6ec1wh/jpadxMwODZAA3j4OvmxiY1cP6QLhx87mH
	VxEUZRoJ+/WLDz/bsjaRggIp5SivML4FnNp+MD4jtmhPMoU65r2je3TDJg7lilmv0wt6eLUpf9U
	GLpeoPPSqMV5apFOA2ichS7WNuvf4Q+DKWo8VF7UIt84G7YYRuqU2+p8G+W3cMwTm27/1W7XdBB
	gQJXL5qjZVfP+kVk75ZRRNZ01Bod+gMvJUj99ocpgpq8MZBtrz3BiNn6e1oaGUzAc8cm59uhHKK
	czzAmzvpKmqnyqhTs5Xhd4T1yUV49IM/tf1OpkFT2
X-Received: by 2002:a05:622a:2c6:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-51305301395mr1124531cf.26.1777910021480;
        Mon, 04 May 2026 08:53:41 -0700 (PDT)
X-Received: by 2002:a05:622a:2c6:b0:50f:cba1:18c4 with SMTP id d75a77b69052e-51305301395mr1124041cf.26.1777910020900;
        Mon, 04 May 2026 08:53:40 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb694fcsm303922915e9.3.2026.05.04.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 08:53:39 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 04 May 2026 18:53:33 +0300
Subject: [PATCH v2] dt-bindings: soc: qcom: qcom,pmic-glink: Document Eliza
 compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-eliza-bindings-pmic-glink-v2-1-d6b5397b7899@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPzA+GkC/42NTQ6CMBSEr0K69hGo/KSuvIdh0ZYCT6HFPiAq4
 e4WvICbSb5kZr6VkfFoiF2ilXmzIKGzAfgpYrqTtjWAdWDGE14kZ16C6fEjQaGt0bYE44Aa2h7
 tAzRvykKoTCtVs7AfvWnwdXzfqh/TrO5GT/vh3uiQJuffh3xJ994/niWFFBohizwTeZMLcXVE8
 XOWvXbDEIdg1bZtX3uJ66/bAAAA
X-Change-ID: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1353;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dg+jLLgr5vkef5Es9bMvn8ytADX9HeTxdUtAAZwm1dE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBp+MD+r0lY0r4VwKhdWRbYplPkrzdJc23mL0vDV
 dLCE27zXKuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCafjA/gAKCRAbX0TJAJUV
 VngWD/9SyyZd6Jus8Ni0gxvVPDqQ6UWgp1gpW0pjx6ysw8sMFsoRUPiJSlWOIMLqaD7iKfch0cW
 +YL3gGEVIzXju3+2O9QJ6OP9tP5e9hBESiuudHoDT79yFBDnX7s3/XVn8rs/+BO0dOXXIJEAFIR
 Gm3kNVg1IS6RQsky5CUA3hHZBsC97ITXA3hlN45cgvm36A3lJWIahP6+M7ff0TStg+jUnMDAuEc
 J8BEll4gfoStc+1R0pGv76eEy1hMbXFio1XJZYDlPsjgppdUJml/2YK/Wbe5A1+Ku6U9jnrrDMO
 p6T9j+pt1aS/k9/0ciKjiZHMaLzJRZFrSaCivouSfpHpeOU2az61B4ltROX0cDnbEie40z2BkJf
 Ya9dmVsKbFLTawGAzJYkCe3QDw2UdLHZGlRxTI+0r9Xp8yO/54aol93bFIYx2y2fyc2PCP+qbki
 Wp5LhpJSOYPUTbkEekTGYU/Zcg3+nU3dAYT3x0qnlKpIZ5IYEcjitjd8oTqUoZeAF8lYFYfJVYN
 O65yRSb5jKNR02ffD8t/4A8WyDak5LtBbvEzpGTSXzbmTMs4xoYKL2m9RJOLcJrfSbgxYIanNT/
 v1cazCUpqAFGBpkAuwssJxE03obT2+vlbn8dBxfzF3AoCsNQeDbfotfhsuXOejBbu6SmTyWZdk8
 gppoAib4FtwWQWQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=a7AAM0SF c=1 sm=1 tr=0 ts=69f8c106 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gcnggjyPzmaCdwFRn6A1TQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=rFgtliq726l97mATxKoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: uk0R91IXf5Qtfa2Ew3L8G4NCLXVcey2E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1MSBTYWx0ZWRfX3ulQTxlMMEZw
 bRwhVH9Dtda7uUD/PZb9K9TgICo09DPfvrvVSurxKzqODGQ/ESLS+AkNryiV+Tj07mzziLxESN1
 NsnFSpG6oBN8NnrWsYeFE5wepCOQsxwkln5heXpvNy8dyd3wYqxr/ecqmRCwioO3oR6doSgU3MN
 J9m+pWVt0A9O/wndFAh1SB1U76K92gRh4TuhyVw4E0GO32kcG/Ir95w5vl748+2aghnj7AzLiR4
 8RF2ZgrTYYl16ahl5FUZN+Pb+WAS8hc6J3lXV2yGiKepJLQ40K0N+0hq+ka/WidBADKYedK1SQw
 eSqgA2xYeQvfKMQbU+pnPZ2eXo8rEQwLY05BkzgHqmIe1NTIe8B+ILMgyTaIXJsidX/xnYIxQ1K
 4rjz6iiAKX9Joo7UY9GY+2TdwqZRTcAqwQRYs6kVt5by/et3Kx7QBd5nExvVItxP/0Azkte0aFH
 rzmbdj8RSqBofLaIbyw==
X-Proofpoint-ORIG-GUID: uk0R91IXf5Qtfa2Ew3L8G4NCLXVcey2E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040151

Document the compatible for the PMIC GLINK interface found on the
Qualcomm Eliza SoC.

It is fully compatible with the one found on SM8550, so use that as
fallback.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260430.
- Picked-up Rob's A-b tag.
- Link to v1: https://patch.msgid.link/20260327-eliza-bindings-pmic-glink-v1-1-f9a65495f599@oss.qualcomm.com
---
 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index ff01d2f3ee5b..411932f6b282 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -39,6 +39,7 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,eliza-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink

---
base-commit: b9303e6bff706758c167af686b5315ad00233bf8
change-id: 20260327-eliza-bindings-pmic-glink-c2f769b4cbbd

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

