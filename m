Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DC938D41B
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591387; cv=none; b=nQS1rYR8WdIM/CGD2eyXfo7k5wgM8gUgtZyllvDMY2uqlvXcoVi3OwfqbgzVSn73PX6u8Cxui1W3d91a2DHCF17agwNFMEDNlPwojhxbXWVlg8ZoWxVELNVYJfzeC7CX3phUcffqCIrVAfvbmxBLZQK//U3l2M4NXrOMITZy2hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591387; c=relaxed/simple;
	bh=4OKybM59XPsuv/9WXUzXsJ4EBfsWcCDj0GF+r38seOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A2no4WxeUFQr3O5GxYn5v7kwDGZFrM4JhMwtFgr1kyM2T8yAmYpW3nGIEoL/8cOyCQYc7OrX53ZOIGwIAc+s/FDtHknF8p9Bl7MhcPEN1oGf/r89T2XdTVVjplUMA7c70AwT5gvfBpFsh4NFHmb6r7KHjhbDPcdoad5WDbhHDgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkBziiN2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsJfNKal; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkBziiN2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsJfNKal"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CAkm86740782
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZwZ3jfJs+6xeTMtYxnw6Lo1u+XTpiWUc2zboWuuAt9g=; b=LkBziiN2V7hJn8Fb
	L+MZkGKN4OP7Ed5EwzOExs0Ye1XjDq0ac9VF9BR50Ey8mCx4Px31CcUzhKHhnpic
	xDc1+Him7Fl3iBmft7Nax+cajgThtC64VcQPluPO0z6pnD8D7uu5PIcQMn7PKDoB
	XdTIg+Nom37J162uVyGcK2bGj6HTdTDYltYICHNaor3Nk3YPRL5tNTZZs1ETm1rI
	EpuvwXv025OhiBSJM6SmBI4diuURkLap/Ck1o9017p/ZLYyeyuxUZkGSyhdFikC5
	h3cO0mVZ/pXeuODrzb2ezdae17qjbpwiljQ7L6IfI0ScDGLsmem/oFhh4AU+km0r
	/Z063Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e42rhrm26-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 13:09:44 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e06cbc08d6so13955132a34.2
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 06:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591384; x=1779196184; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwZ3jfJs+6xeTMtYxnw6Lo1u+XTpiWUc2zboWuuAt9g=;
        b=CsJfNKalr3wxKXm0p+8KFGjm5S77RdLDAUdnS+yQf76oKkNai+ROkl4+GNalFp5bJ3
         jVguSx/3VZ4CtsOAt9uQulpEGzl/oxMMK2H6fgdGpZuyB/qqRumXrpZu07SY06JAM0wQ
         ZfGvpnwbXZCXLMhZMN+xNN6b+5kLCp0vgFbJd/UxpQG5CQTOx271kCnyRXbjhviZ1Mpj
         su1eElJRx5RxKUU2SWe7yQFQBptiiTW8Ow5ml+5JLAdoPb30jE/JwKdCqK8J+DdlrrT2
         hKlBn35H9XCZK0fVxSEn9RnRhTl+94t+khejIRI88AYllMgU2cRXtPe7qiqUkKlEEvKP
         37vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591384; x=1779196184;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZwZ3jfJs+6xeTMtYxnw6Lo1u+XTpiWUc2zboWuuAt9g=;
        b=ESCda3OZvoKFvn3rlZK9+Dwx73kjfASw5cidLFUEy6ypiqkcKfYOQ04qkiy8oX0hjm
         85S8VExDZjONLI7HaaneIDwnTS9JKwiGmf2BN+psyxLQk28uoj6U0/fFsw+hS58EhXKQ
         5sGoEV8codywNuTBtsZOvmrQXOuw3DkjmhTgudhQ0P7gjAEz/BHmlYTjOjdUJVoAcADZ
         M4PbWUdmEpjjdKKhMCRRQ8VL+Ui4kA2OD75qenXWWbqfzqV6TH0pXttnf6sWrB/Bpsa4
         veNgZ/dSYb6Wf3FHoHA8qTW5E9IVQVKudOXjxRu02ELOM6FeWzstDCMnN80boZOmO9KP
         /ypg==
X-Forwarded-Encrypted: i=1; AFNElJ8NNxk0sMkrpLVN9lebszoCPoaiOhNTPLTIWoPiW53CSxHuraeCKHcXnkKK92btUcpHUTQwPy7CAsKy@vger.kernel.org
X-Gm-Message-State: AOJu0YxTqhp+48K8+FLEMMPFnGEpcbiQWI0pl39y2Ht6HOH6g8Kt7h3H
	XgyIpre5Ix/FTF4ZeHp+QYQET/CRFM7aOL7JnXQU0/DFhYqgF3oGtfqlP5iKn52jdneMeL8KLiY
	2vkHxWPvezt3eAhE/n+hv8OIdxyI+Nn2LJZOUyvFFicwj579vqdiefSWemx85WCzq
X-Gm-Gg: Acq92OEP+umUz9KEKDKG0MUDwLCIT9NZaul6I3GsnGDUJWPm2xPo59e2jOjLw+tzd2H
	dXZSUyYwb5odree9OvLQ5oyzKPU8P+F1Egri9gRETY5jgU0OjpECcGEUAGeRJ0qm8eNiDrsZxJ0
	kfXaqa2aG/qvXj8tsAv9sJ3vZLuRGKeZ98pxSiCKYFg2Ewck8blc9wrj9OC5H48V+b9jV6zC8AE
	14xvsV98vAOofaBZ51iQyPt1YKLGFQNvR/lcsKtDWvxUme9TuiKkav5Zdm7ta5m+6IDWlDaIpsW
	LdttOVRcH+bDpyH7ST5Uee/n19OiXKuNVNTRgUzND738R+FQdkc30imsf5ljPW/h8b14heybrmN
	TtgVpOycDgsHvw0Is1TiDV1ZIzl846vAzZvU0LdN4XUWJKIRqJCmCCTclaH4PYTWmM9NNHXzIQB
	hXLE9qamBgZep5wX9eJOdc+7nrEanxXa/lB/Q=
X-Received: by 2002:a05:6820:16a6:b0:696:7780:477a with SMTP id 006d021491bc7-69998d22e20mr15563319eaf.46.1778591384385;
        Tue, 12 May 2026 06:09:44 -0700 (PDT)
X-Received: by 2002:a05:6820:16a6:b0:696:7780:477a with SMTP id 006d021491bc7-69998d22e20mr15563299eaf.46.1778591383961;
        Tue, 12 May 2026 06:09:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:29 +0300
Subject: [PATCH v5 1/6] media: dt-bindings: Document SC8280XP/SM8350 Iris
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-1-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1431;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4OKybM59XPsuv/9WXUzXsJ4EBfsWcCDj0GF+r38seOY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaTaVgaR+8zRVqMMzeUJcbV16/TOLkjg2GEd
 V8Vdv+vMSmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmkwAKCRCLPIo+Aiko
 1YbxB/0cLBR425ZFemwizwewJ1p0MnZusvFejKh9tfC0f6DS1CniG3eSw5EZKrmtjW8MlRA+SL9
 ABmspuBEoBshnAsDGkopdXmraNMLml0gXoGAwM1EkQkHZe4We7hzyKyFV2TcLZ6xaw2XOz9m5l9
 10LaaMm3Df0QWhN8eese5w+gm+1P+QXulC2tKgTZ23ndcdkqs3r+QTGg3M9xdTKynaN3XmOU50f
 fU71GNv+aVng3jY7Ngp8PjnCBcDGFLkweF5oq8hC7diwUC+0DjLudTzZg81aBrlE67QMSn6FNgG
 hmBdvah4qUIo0wFnUjvpw9XYrt4V4fUJ85kK2xFTeQj0UC8A
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfXyZajJcyr/qh9
 Gcvt3qMPzIRWNXU/806C0wiM0eCL9TWMD5YQSEX4s5eqRcdldSamHKn+R+CmlMLRvwQKUa7Num0
 TIDYtGNxLIyAF118a191tVwQ9XnNvDenPQaoNvuJ1lAgxg5DgZwdpF1u6iGowz6ahlrVG87XjzO
 xPPtTd/5J2V7rwx2OYh44qpQqNSrpvHB3rwRTKCI6tRj6yveTtdhq0iY/9OYFJ2J58D0eddDwTC
 nFypx9tMT2Ua/n2djwMCGh9sM11XicPFmFHsJl9AZsmXSBsEE3JIJU43l82mTyGRw22pegzeyg/
 nkgZP0djvYFQSvKhPy4xzxQ2jPEr2H/it24LFjl4bvTCSqcOocYdihq4MdEjESbvkUpvCLB93se
 AmNtH7R7AR50BXKzvYUYPH9FdCiOqBVPxHEKtFKCQfl0z6UGkfv9r9QHR1WgIGh3TqyauI7swVk
 GhmSo5qVJCTw2CdfDzw==
X-Proofpoint-GUID: a_-xsmzYumre_3dIrdpac0d7z2zbD4tg
X-Authority-Analysis: v=2.4 cv=GbMnWwXL c=1 sm=1 tr=0 ts=6a032699 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=DuJnIZi-_EB7d9bgGRcA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a_-xsmzYumre_3dIrdpac0d7z2zbD4tg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120136

The Iris block on SM8350 and SC8280XP is compatible with the Iris
(Venus) on SM8250. Describing in the bindings that the block is Iris v2
and not Venus. Document SM8350 and SC8280XP IP cores, using
qcom,sm8250-venus as a fallback compatible.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8250-venus.yaml         | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
index 43a10d9f664e..1d337275c9f7 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-venus.yaml
@@ -10,15 +10,21 @@ maintainers:
   - Stanimir Varbanov <stanimir.varbanov@linaro.org>
 
 description: |
-  The Venus IP is a video encode and decode accelerator present
-  on Qualcomm platforms
+  The Iris v2.xx IP is a video encode and decode accelerator present on
+  Qualcomm platforms
 
 allOf:
   - $ref: qcom,venus-common.yaml#
 
 properties:
   compatible:
-    const: qcom,sm8250-venus
+    oneOf:
+      - const: qcom,sm8250-venus
+      - items:
+        - enum:
+            - qcom,sc8280xp-iris
+            - qcom,sm8350-iris
+        - const: qcom,sm8250-venus
 
   power-domains:
     minItems: 2

-- 
2.47.3

