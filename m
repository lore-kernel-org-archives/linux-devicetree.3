Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999154E7808
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409166; cv=none; b=kRCzVIs/0+y4rBoTuTu3egvfEEjryvcDqfFy9yRaeZ41bmKeonFrAxfH4Cp0nZYafJmEBeR7MQNGDZHonaIagXQjYmV5J7muk9rLwE0by25C/VmXk46+51wzKPKhhJilwaNDJOvgrGXckDsEaHaTZiyF8YyKMmnA5f+F3uiQgWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409166; c=relaxed/simple;
	bh=5j1+5gWDZPo/v74nUWVlDehbVbzgsxlj7niMYz5yZPc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XfRcVyFcWbEm74/ajeB8br8xsO9lGRTahef1f9U62POIARpuzUg+Pxgb3W4wfUBUSXFm87xiNRz9FY7wGP4ayU5BVTSsI9yLn9hO4XnBDmyU6TTAYPGRfxdjyLCzh30PItwneA0VPGmW1RTSrXgU1eNj/HoUBflM0otOEZw0WYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feU0h8Ze; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EGf4LkOv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feU0h8Ze";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EGf4LkOv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OtJr723142
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=; b=feU0h8ZeXYHiiH9X
	eoKb3NhJ76nB1ofJYJQssWZIzNApbA3KKqsXVseIty9J0jFcSv9g57EgVjfIJ80V
	FXF1Hd7oBkvES3EuJ97hzcScQqjy/4+Ujm0vN/RTFWqiAXXNKR+sH5svsvsdYuj/
	V0aEoLQNvg7offPJn2HUFrfukei0vorwjdLg6kpHozhUmvN3y3gxbwz0HoGqTTBV
	JxnVsLZ+XOkaUd9dvnSQ0vEPaWCKPC4tO6XzOoojuGgBmpdPpBt8pHpPFzWh9Rzl
	WqZpNTwPjIp0Glf6uX/xdypLAwGlPgb86GMDl+JtvOF8tLZDnro00oY3qJvpu8hi
	l2Utgg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf65gt6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:25:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso533079785a.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792409156; x=1793013956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=;
        b=EGf4LkOvWyt3S3VggbjMIZxrVNumJmofjXsJriLE8XAaVviBFNm+SoDkpzV3K7zEJj
         mc/b7nPWGSkXVqDBeTK6hN1oPqoLBfqoNK9ZIarvbq19yY2gKe+dLZThlRlavHiDTTiZ
         UkOXXwcbDwGRaMuhuReTZFLnVTgjrGnGb+OKYkR/XC5/FRPlN7G6dyNLhsI2pNjz5qqe
         KWrpCP1gWblPAZq9z9Fzs2jETmxvZB8JC7ytSg9JEt369CmSDl6iLSRM+8/5vvna1Y93
         nf4IsCytJZG10KlLWSU69gS6iAYFVpe1dxVKXQxAS+RuYFtfFG4MwVvBxeVUTy6EL1To
         v4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792409156; x=1793013956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpTZBuo4GWUkvLx9haahL/OS0k1KfhQyJgJvKZBWP9U=;
        b=j+lltVwWp0tP3F3LCZ+Jc1Gdv0IuNPr695RmN2Rl3n21EKpxFIHVW37O2sKpzoMRaY
         jI2KqFVgO7yNj/+ypaQrNJqDdXvZy7nJ2WB2EliOlxikqkhIkQZk6vYSYAxvNQ92aKFw
         1dob+1j4Ut7Ws2k+vDySYUnvi6YhT0R3w9fDHy+LhWsvuyhC0z0syTZR68mwRhfqKGkI
         ClhWfgsYufYPga8YFChg4/QQDwk13Xcf9DP+FveuP3F/1D3vdx2K2orktlXkw+/q6HXV
         M5fMTQgBHfajl6LcK9T1tl18xHeAs6r5jvfbcpwHDFlkMYJsLHDNTMNPTtwpJoD8ITox
         kZVw==
X-Forwarded-Encrypted: i=1; AKwUvBzNuTyCDTxuAF9/Bx/zTuHwegIO2HJVS6xbiu1/S4F8oZoxA8ZL3TmWIa01R8UZYmwMQ6TvBbj5qq5d@vger.kernel.org
X-Gm-Message-State: AFq9FYJNMFvR5fDaWcqEhHwYjNKCN/OkBkqRBZLPg8KP8s2ImeU0Rj0Y
	A+DKUDKcv/BwvAwhr1tj2HoyR1B1ixkZkdTEIrLTfxGjwgQd466mPiNY8NYr5JxL/YLtSQl1ja4
	I/p77JWnPhAQ1eKez9wOlT7iWrkbOsAd4O/LVhqyT33s1MWC6rxUaZCoKppyLOvcf
X-Gm-Gg: AYBFou02SWTFLuYc00tGi4UYUkLMSf074rdeb3g2MU7MnTGa1Sv1rFhF0seF+BQHMu1
	0r3j4IJMRXuG26TNASJz1QNJxg5ct8hPo0uAlI7I3B/EILEYTQiZ0KsLhHbNUCOjohymgGcbRPx
	u1JEYlKnyuqNlysPy6ar0WvUnuOA4lezLI+zmeIdXBWC9gpO4T2DeD3j3v5OmWrUtELKwL+eJ0W
	m1PfymOrgyJ6lAXbGGMFvtmeW/2c+8AtjpzMNDFa0USDe8jydseUELB8BS1FrR+ffK7YupHpxKp
	ZPzJjEGsmIkso8o2VU1bu05j/BXdHkPllcSpiZwnVDNcQWqz//uFlgFedFBsRpwqW1bXZu7uJpr
	k29X56r9mDGJa0MqZ6tcsGSpj0ZuTstYmfB98pLeDRaypEbQKVK2UdYYHKix4ZdvMc9S2doxSTc
	c3c8EcmX3KzT7k
X-Received: by 2002:a05:620a:3181:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f29b65959mr1138656885a.4.1792409155469;
        Mon, 19 Oct 2026 04:25:55 -0700 (PDT)
X-Received: by 2002:a05:620a:3181:b0:93e:bcbf:88 with SMTP id af79cd13be357-93f29b65959mr1138653785a.4.1792409154919;
        Mon, 19 Oct 2026 04:25:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ab37ba8851sm12807621fa.22.2026.10.19.04.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:25:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:25:39 +0300
Subject: [PATCH v2 3/8] dt-bindings: mfd: qcom,spmi-pmic: add LCDB
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-sm8150-display-card-v2-3-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
In-Reply-To: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=889;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5j1+5gWDZPo/v74nUWVlDehbVbzgsxlj7niMYz5yZPc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1f45YrRHdCDK8bawXDs3JDG84GqSMd55FbwB1
 iURRmnFbeKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatX+OQAKCRCLPIo+Aiko
 1fmSCACAe6SmTmaJZaTQrBt+Dfdyi5ffb1oQGY06s4FGLcr2y3TVD+8a1QPhWLOWpgLyWsvQ1dJ
 jahbLyMnTOxozSmpGz+gew9jTiT4esexYWMS0nC89rt9jGjG1x7x7OCYq7GMERuAU/vAuDCu9Pc
 TuLeJ+iiw1RtveSf+2Ed9fIaDS2lR9Dj7TcZedIQlLMf5mbHvhx3EIQkCLghCmCr5c2wxsjSCLr
 Nsno2PH+h51Q1ID9bhpYT0Bd6I3/XgILhRdD8VV6rNZ6sTFGfpNN3ETS3x1T1ih/1rAW9SNstDF
 UGBPaqAFev1GoAyStjNrsmNmIbfvJHAl5gRMokBuFfe6H8fK
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX1nJ1CHTFuVUu
 I5DO+UfLywGy/OONwyNulhFHNhW6XcDBRVmecUc2DMwD3krhB2bPQC8+O+ePv76qDPLJmj9NbwA
 uMvs08TGpnjexzZEydzWuTUAJrffloU=
X-Proofpoint-ORIG-GUID: xVNqrhIzhXG17TLIm_iqzehM0EzkOzXO
X-Authority-Analysis: v=2.4 cv=Y5ptIReN c=1 sm=1 tr=0 ts=6ad5fe44 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=Pve-c2K1UEanVU4iL48A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0NSBTYWx0ZWRfX/dKcyolFevLp
 wS+4D3Ue61EBKzUSzS6w2N2uR+5Wev/DCo5rovrM2nXnCvOW2l4OKEOTS8Oc05Wst/1uZgnA5EX
 auVUUjw2sXaB+mxZrQI7jcTv8fsCs1c6wo6zias40M1zxVK8n+a0y+7BAJMTNn69RSMjGvYbQKy
 LD8S7t/nRjBH9PfUObjOxqaPDC4eOJJYLM1h6xaukaCD34mSvnLZkAcLUbUGizfmgrHXhK9fLYZ
 guGbuFBo+wY9EwT6qHP/QdR592WXBbA4TH7FGHbH0oU72pCYzx63yGgAopmZSJIS81UlMOb77pG
 ZGL1E14h+kp+nC1XFRnhiuhG3WuojvB7uuT9xDfzJqWUxUhxENDoFhXdfHrLRTHioDxD5MaHtOU
 DZBwZEPUU6eBnTKPLTBcmPs7tvHUP3TEvC1tu9CL+7NslDrngnEPznhG1yW5T07pKwach4yqvyg
 vmGAwWghxgNg7N/4QfQ==
X-Proofpoint-GUID: xVNqrhIzhXG17TLIm_iqzehM0EzkOzXO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190045

Allow the LCDB regulator block as a child of the SPMI PMIC node.

Assisted-by: LLM
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index f6534e9e9912..3ca32d741e68 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -191,6 +191,10 @@ patternProperties:
     type: object
     $ref: /schemas/power/reset/qcom,pon.yaml#
 
+  "^regulator@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/regulator/qcom,pm8150l-lcdb.yaml#
+
   "^rtc@[0-9a-f]+$":
     type: object
     $ref: /schemas/rtc/qcom-pm8xxx-rtc.yaml#

-- 
2.47.3

