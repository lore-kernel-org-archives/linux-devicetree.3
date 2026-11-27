Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779801;
	b=QqcSyVcKhRoOBCrC1w/rGIGyC2hYhd/xbfpny9XufSKR/Z6yg8+uDISCsuW4J+PQ7hS2
	 /B/XGQEYphPGbDUiLizYQhQPw/dSP/WdO1VjxAHz2axxZ58jQDT3O+/GXDnWxVaThMjxW
	 prQpPcMGWx63Uscdm/jih+cTZGvWtbhvFhJp862XN+tZf3mWEDLjBqRtRIMQhUxrCNnUu
	 Go3RNoo8ZgLQ/JAbIx2gJKXei7BOG+v25QPehrFaqNQpY1iDctEBjLGFgz8mHfvDEQDBX
	 FK3Mcpl34WaOuxbHYhqFMbM/rN1yMsRbj1RowAluQTmd/hAm8slMrDasGiOXx5NiS3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779801;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tLdJguhF20Qz5s+iyaiSixI+ncsxjnzmIqJrlznTypQ=;
	b=pJ3WV3H7m6muO0EBoElWs2oMCITG/9mA/ZeSlX9IbyLaKqFSF2W+QQFa5A32O9Q5W00I
	 IH4sbdWgQEA3cqtY4MNrGV9JEfF8kB8IL+3IkDoM/LlDDGa7RGRVwaEVio2cKG3ytYnGY
	 cQ5Ob33tNHkymjC/YWTvTIB6zXsb6oP6mGxcuBxZ7ZEF5JGkzshxGDzVBMFz8EVZi8075
	 OieJ5wc383HUIShkOxP+8LeqVd1KkluTbRAxyi9NafkKd8O9c6QVKx/MMeCbQFtw5oY1m
	 GzrnrqPz5O6Eby3r8oPF/MPjacKdB4HmtkWkbts+32Gx3w9IbTzEe8HJQC9IatvqZKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsjHB2uk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifdRuwxF;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CEA606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3CEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WsjHB2uk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ifdRuwxF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp1HP1047034
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tLdJguhF20Qz5s+iyaiSixI+ncsxjnzmIqJrlznTypQ=; b=WsjHB2uk1lWoS9Sa
	HD+yqNc4etgtLHameUFuwfGDKQhWHnd9xtZVJtunmW7gz5oek/ql0PJnooMp3M7T
	4G3pWJ1ttbB9P+ujsrP3z+o8QkJsoNY07hgWZNo8cb/mWRzzAaJUQv1+oouPJhgW
	jrxH8uZpKS/OEp4M5dzzygv/Pp+VaVEGz2OC0zjmSrTjYNx+0yr535vPbXbMImYl
	MuI0OWMuf5fgGy5mPkezhd8Dp/MLXyPsEAG1+cVg9TImOemszs7RRiBCYEh7SNgH
	TbjCL8xW/ir6NzUuH+1BaRMiKGToFPxjTEt2UD7QYOzGii5TVYacTPY92LSTVd0k
	FCM5GQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqksg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d3232fso1098912085a.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779797; x=1796384597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tLdJguhF20Qz5s+iyaiSixI+ncsxjnzmIqJrlznTypQ=;
        b=ifdRuwxFRkLDgMIOt+Ur/tl9jq5wySKdxseEJylChqzUj+ClBemYwhfHcwqWWqlCtB
         gN4Z9QfNDZnYMyppcGnyBNNLaOl7XGX0VNlspE7jtdplvwPO+l8pyj1WOmF1Jt929MH1
         5GTs3E8+SjJNFr16rJHugU5cnUwPiBOcoki9ZpJPh0A5ekaNqD5HbhGgWQA3NiNbxjS8
         WmrNHBhYuWSiin6GpQtNpCb/bLKoKoa1FBU5MIaG4sgrS22+oVBZ7NiilCQcd2CqmyCM
         EF1Bqaw2MbCe42BwnR5nBy342DA+rD1RoLahPS8yajgzXJBYM8TWAWAAT4nGoqdhYFZL
         EyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779797; x=1796384597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tLdJguhF20Qz5s+iyaiSixI+ncsxjnzmIqJrlznTypQ=;
        b=Sw0426TMP9r2JgBLZ1RWi/XhXqs0BXbRtCWL9XwzUqqYUb+hKUyYuE+UrYKgtveg0A
         bJ9h2qmJ0y7TWkI2ZVxAeb9300W6N7z3/op4LKBj1xrjkyrsvpxtL5gLLf1mYWu6fZNI
         y5mrEOHyjPGVwLuv9jh72gAolGEIcxFueOHcgL0F51wO5V8XWmVyVqNjU2nRKsL9XAIy
         hyhFunenPANf7Fnrt0n+x5ihqtcdJ2AXT9vTxbwywYi/xoaF0VX8KLMpEBA3giIEHle2
         QrD5yptdh2xk+nvh0CiJ1mJzHxUHO8m3tPz1n/cutL6hgVNSCF1NQFCJqaA4fzEQMrpQ
         zsQQ==
X-Forwarded-Encrypted: i=1; AL+hErFIb3jJpTPc1xS7focgLAbsoD+O8xmRHeTfUSiO2vdCqk6dxrbXsBTq4jlNrRyldKD8eTBmq/KfrcJE@vger.kernel.org
X-Gm-Message-State: APuU4Z8OT4oXKlhPN1VAcIPQOGVXqLuuty+DYbFWze4E7GRWkji8DhuX
	BOdAhIJxd0gsJ2Z6P2eL2sN1usZSMzJk3cGM/45vlZTxekepuuHoWe5sv0mw931zgTDFt5EN74+
	Rd9K5AO2+UhS3C/zEyfepYHaTGnvY0FoszcvEwka4VAY13M57SzuHaPQ93L6jXcD9N8n+Y+o1
X-Gm-Gg: AZFdTZfFTnSP94+LnCARPg8V7KtIojzhw4uOZKawCmKZ+uHVLiJKHxXoXlyOcyMMMk4
	HabP6u6w49HRvKvWLuc1/0v4NwbqOropJXj3QH22sIL8UeETYtfeXAMkZQEomfXwSXeEyUEkkHt
	NQtTEbh4+Dew5gafHLekt9w3J2kfS74878DM7WN8fCqOQ0W0cw/kNPtj0yo/sGMl01F2jzUX1Q3
	l8WIKzfD8H2wChoHa1vVOaX0OVU97Kjwj/ZEFyS5mwUCn30p4NBZOKkwBEkpQNxw2AK6js570tg
	0mTEMgG2CvZpGwcEy4jUELUrYUy4tn+AqyeYI9dnxr7WkMqbmBjltZNasx7/HZtj+qD4SJiAMBP
	+ypjCyveYHXk33Hiat59KxxZMRZ2G9QFoNTv8vFVKZfHYeLYUHcjWgKpM3Veg+f1h1FBPdZi5SC
	nksA7bpLIpDVCLGEO7mR43bP9U5bjIgvMJ9q740ucAaI0dhdh+friv8l8hBb7cbG8=
X-Received: by 2002:a05:620a:a8c7:10b0:94a:8bf:19b7 with SMTP id af79cd13be357-94a08bf1c31mr1028688885a.18.1795779796954;
        Fri, 27 Nov 2026 03:43:16 -0800 (PST)
X-Received: by 2002:a05:620a:a8c7:10b0:94a:8bf:19b7 with SMTP id af79cd13be357-94a08bf1c31mr1028685185a.18.1795779796464;
        Fri, 27 Nov 2026 03:43:16 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm716120385e9.8.2026.11.27.03.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:15 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:43:09 +0100
Subject: [PATCH 1/2] dt-bindings: power: qcom,rpmpd: document the RPMh
 power domains for Seca
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
Message-Id: <20261127-seca-pm-domains-v1-1-013c28eafc5f@oss.qualcomm.com>
References: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
In-Reply-To: <20261127-seca-pm-domains-v1-0-013c28eafc5f@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=862;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=oIi44YUOlcdFNq2uRZjXF9VXpea2s43af0wtndVYfJE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWzRuFRTI2wZs8SW56dl1URmOxezH7qBju/aR
 PzLXUW3wguJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawls0QAKCRAFnS7L/zaE
 w+1cEACcH9m9G5NnItn/DOB22uAr4Hw+VztrWEW5zvzAO9ooUDxuQkBweoxYEqkkp3yIzQM8eWy
 LfEEGKoNX9x/CACqzX5jCixqpilaUzRLbcHpc//rxv0e9AuhPpDATmgSrNVSESQQmr4gVWEIEVZ
 e7CMJZ9wv6oIXRhOLZS1nk8PoqjkgsgPtiHLIsxNgwA+gpNr7lELD15guBCA4VI9tqYh4sRO1yg
 tfLdyuvtJCWQx98LTxVrsT+Z/vZ82Vrp09UxlVH4fRIrJnshuEXFAwB8JK9O5JPqglK7aNTZEQv
 +yRsp4rpKAd+yEAhjkkyREH3rypr2j/p2J/U3jCXN1Kw6oxz6XpWqcKWqQvhogfqXG0vTr5dxeB
 Ym/ZbyXauG8dGm2J/bZsawEcdfglEfEkrxgwpwQ8yStn/satHXHPWWuauA0/rkbRTqjdMkx3qu8
 bf/6gl4HTqpbyeeft+kw6qCf83vGJOwx4TglyVtw860F96hLkF9tOSk1czwqD+IX+r3CxX5puh8
 vqPApDufq0wN8OVGQDEhYDvlp1r8mXWzfw+YwRwXghBq3oa42/ZuS62LEYv3Tl7KyCE9sH94AC0
 pdNolYXhA87gb4fp4MkVd6Pib8c3UgRgqMLeqoEGd8lE01iXV2YoaydoqD4KjRLGI07ZeBrNdJ5
 j3HvcgOl9zknwsA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: TBqWoxtWoCXlu0IfNMUIt4Nq5S73Uwih
X-Proofpoint-ORIG-GUID: TBqWoxtWoCXlu0IfNMUIt4Nq5S73Uwih
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b096cd5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=I5fhp5uXFRFXYo5OHCMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX/CjgSBAe47Oy
 0xgXFlJg9KYv2LSPhhviRSdISkG3JVvMFcZ8sL34H4cnRDHV46dSLQu7VHp3MsArHk7ThORJoaX
 E5SWx1TsqK49mg7VxHvhXyOBj8G5ja4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX9BnZmA5MsZNM
 yjf4k0AdDYcRBkY+M02Zd5W/xqB3GP2i721K1vqowk6HwVx46L0enpSeAKZEeLR4quJDZ/sZy1q
 SXgDFDlnXJhEDExFfzMosGfLUNNxqIQ8jCALpjAHF29LIz+T9E5eC2pCHBZS89Lv/WxO/vRJGVB
 6nVBAcbdO6HXsgtJGSMOdPcrE+nrIDQ1CYLgv46MGG6U3IKqkDZGH9Jz3nn/By3ngjcWhDECOaL
 Vhksil0zyslP3w27X3MYS+fd8lyzJ65br2Z188Wd6w0JQmqPcf++e6btfbGWNnZlLNq2Rnht+9p
 KGYUIgVAMgDwUoLhgajMeT89IbibH0sAUEBXl1vwCtNCcqr+qli2QdfRXXde4cEYRMbEQphR1Gj
 EvnZZDbq5oaeuuvS5JKnKActj1IlQF4XFtM6g4sJPO1qu4RBcHJEPn1vqCEuFrE06TFHL6Fie7C
 kCX0wymRDFl44m3kpkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Document the power domains for the Qualcomm Seca RPMh SoC.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 663baae9cc641f16d8ef0a24c9bfe4eb33a37a71..c72df9bc84801e244b01ec5b46ea1d8d9cd0b0e6 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -57,6 +57,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,seca-rpmhpd
           - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd

-- 
2.47.3

