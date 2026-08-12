Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD14456293
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542314; cv=none; b=IddrH4VwtAWjeOxIA7JLu+zndc1VtFX9VMKx8nuLCGXvbndGtbgmy/jP10TfU60VY1aRmUnEEpd2g9oDo5lFS91nA0FQEVtjHimG6Ix1mMhEnxGFqy1Il7kcIhsd+QSOgmk3+F1RKNLt9LVMelUUi0g98K252CbdkeZyXFViaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542314; c=relaxed/simple;
	bh=U3em6SwSlj4KrC81ebU+WoLSGrV9Shrp6KLnWRxbzWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uoAfLKLLiivZHHnYufIIljGNwg1mjrOmZfM3/dXgMR6W0TGaqB8+RAli3rl90Cbj9WM3jYp7tRbkEIqvD0iF6r6zzj7gotQryAnS7UOWUa1tiKxVC5+wYDDxz6Xi6MIO3yE4g7OzOEqUat6PiwelBjAnsIu5bs9cJXy81bvCcFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXWybFJ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dXG9tRUB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXWybFJ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dXG9tRUB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbY7S3597627
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x0dBVTf1+zs
	v5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=; b=oXWybFJ1QQQwTFUe4MR1DpXYnu8
	tDnBWvlUhcat6r9lZP57Fj2SCCLVo+wutak6ZaQ412oyQ5BnwikYXvkNJvDm3qig
	pdBIwBwJwfNdAHRFNH0NAnR7aq6yRBOTjCRAH4ruoOH/s1v4OswDo0v8wG6FYiNA
	Y0dQBnTM8CuprK0iccvllK0yRYnYNJ48OvhXOAl+rmIHWLSrz4cgKnc52yJLnGtQ
	pBxawrMQoi2iJjNgQeeFwfb2xS9g4CflqDRySNfH4r22pjbCT4u1RHNIl9MgQ8g4
	F4QNJIUPfsONBDz2DuLHr3ulMB/N9jAVhBjtne7qBnyZVSyxYlJHSKe0+Mg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrm3mq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 13:45:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso9197491cf.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 06:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786542309; x=1787147109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0dBVTf1+zsv5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=;
        b=dXG9tRUBtswbieRUxgYQE0ZdJIAJjChAH+k+yE1pZuKsg+U6640zhjjoggatwJmIbL
         Z4PosxTIIFpZ8ewMVoWJJTWPwsM8Yb9Wxsz77dW3dLi9xp6bZv45H+xj0uRQcVYm1Pq2
         nr9oTzEzbEWr+wkaFTqvIKRgFG3iogPjeQR7LMbvy0YyoZxl/8kwstH4CL0Q4FDzCTbO
         uuzJkHHzmsOY7aoD58GUuOx/dbt/58iCCNeFFzM7YxfPoqOJx4M0LarHMdJ4JsiOVKK4
         PT1/IwHLeFB0qnE6lD68Ydzfkugg/S+/KaFdbJFNDoyMsd3eyAjhZreI8JaAo9g/cWnt
         gA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786542309; x=1787147109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0dBVTf1+zsv5GhKdmDXrH4C+CVNQ+zjeZPwcZnyxXY=;
        b=hiFuBnjOYM4PKWwy/KE/P41KcUNT9EE5s5QEiIMJR+wj8G9llftmpCiEDYy5H/OZN4
         cAtZnXjw7dGbux+lqQgYP6cA66TlHvsfxBnmLD1LLVROFgGN6P6mvfPt4CKEuEgKPz3R
         SBDLCK+pIa6pR3oYaDEZzyn4keoxkzYztMta3FvVoP7FeJURww1tvZk4qUw1E/LV5hSv
         nLeoqj0U6q56tFOpzqOdXflonHID0v2N64cleq21Lj9t75Ctc5Dj2xQYLTqb9MIRqeCQ
         WMIU4VnOOUyYHVp+OtlStWMYeHxrzwI+jYvUxJBW/+3scuUxY/obhs6jmePUttBdgtYb
         aGQg==
X-Forwarded-Encrypted: i=1; AHgh+RqLL3xUimA0/zRO+ZZ71OYyKGlbhkcx1wMlIOu/NOuxwDyWVKsk3WowU2M7jp00rbmViAU5lHVg4OGS@vger.kernel.org
X-Gm-Message-State: AOJu0YxVOkYL5WGd3MHNeRQsCN6KAMkGr2a7br5XuioJXCXSCPDonNB6
	iG5p8ZAxXqCCpyH7Ph9dNs5rfi07N/aWNqU53Bmitdahs5M0vr3DmhH/xLamusIhXvuyO/mpbKC
	TYQUKTdzmSc3KlU+IGHbLKRPId8lHu+aiCF+UUNkZlmYTtS/t8TYn5TFuqgMFthJx
X-Gm-Gg: AR+sD13BfFn959yLFJax+tmIzFCyOH8wviPHFskQpfQuKp0ImT4dqH8LJb/68BiV68p
	nJGXkCh6dOyTYQ24Rlk3F+WUgCxlTsz+sZ4cuzrbkeWWWRzITDv2Kvd6ErzlLsfgedyDCJao062
	AHLKWzTEOFL4nHB+ci+eRTHXb5/1A1cKMG16uambgpc4R3Gk/5LJ6vF1vRULEUwPP/uWlOc2yc3
	CxMTQd6al8nCRwqB6vSacsoa83NF3CYW5BNeRBt2ulcAU47VIJFeiW+534S8ELCzDXNdei/EGnf
	1dzEd7oYlVO+kiwpBSNNwA2oPDjZWA6tod/D2dxdD2Jz51cNuVbTuji+gQg0cBX3L6E8Namfqqa
	WH3vMFeV6PjwReFLV
X-Received: by 2002:a05:622a:5989:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d603668acmr73266091cf.22.1786542309006;
        Wed, 12 Aug 2026 06:45:09 -0700 (PDT)
X-Received: by 2002:a05:622a:5989:b0:517:c65c:4987 with SMTP id d75a77b69052e-52d603668acmr73265111cf.22.1786542308419;
        Wed, 12 Aug 2026 06:45:08 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997c993d80sm52793265e9.12.2026.08.12.06.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 06:45:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: Correctly restrict number of resets
Date: Wed, 12 Aug 2026 15:44:57 +0200
Message-ID: <20260812134455.179663-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260812134455.179663-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=U3em6SwSlj4KrC81ebU+WoLSGrV9Shrp6KLnWRxbzWQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqfHjaqHSxeEusnijyOY1RwQeO1BnEIQ+M+NAdc
 bV6gEOLtCGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanx42gAKCRDBN2bmhouD
 14GaEACRSlPlA0NBNuIWvVPMZrLNYeUN/QZxBfr4ZzHA5INaIbkJQ3HToEpxIUjfiqfsEtvAV7o
 xlXprcj+0OewKUL1R1L9IJEwM0d7Naqxff1osrSCMGMyBr0oUg12lyGyJucr58iUnvNbpK25OfP
 /tli2TeMjx6BCHhZ/PfdlMcAPfiGWJaKC+i/hREwXuTptikahwcZ0NvJ1w49f0Gi6m5a9Y1qdi4
 YfDITaR4qnAfGh7iOxSi1LutiT/yeliuFlOcIdNVG7CFWcCi2fumTZBjfzhHSXGnUCeuViQ/kVE
 RB6ZRGsxMRru208hdYgBEfJuVQktRxhJg1Q4+0hrKhcUfDMd8DjhWhl9qOIRskpqnahs7+mRbgq
 Wd1bgr1ELgfIsDt5nawmkybHYiTNlP6LcbvYc4x+XOXR7ywsCtBE3a2OKXOLLVaQHxhjFYCJgwv
 EAvPF/MBP7qvBL318Soq3SCFU7k7j0X45c795Ap9J7V90aylQ62LNC5j2oSgU17e7yTpkawJyiX
 c8f1ZAZK7lc+WNnq/iZKpQkAyRhKjPap0DDiErYr2ZCoCMin4H2tg/ERqoLM5lkqN09uDvMido6
 wCfvBClZHbNy4JaN1pfTD6Ckkp9HM3C1uwebm14Y3z8un+AUFrIi4E+A/6u3nDj99Wufztqv3Q/ lYxeE/xPFwLLu8g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3tH-Tdo9ugthIjN8gwTY-s4qEBqDYo2O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX6cCbKXBmeDzN
 m0NYxdjlHXHhlUACtm46ntplUHxD5Z7j6qnJj7weYZk8OcW15+FPDlbQgGPZn112z4g+MEU3v9o
 wXhKiDcJprmfTXHQ/2QXsx89w1Xw4Do=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExMiBTYWx0ZWRfX9TnS717E4IwJ
 un2zNtZ95k0wFAcxG8GmDcU/KXfsJnQHm/setNk2xMX4FFcHaWApt3oQlQTuapPq6BTe056Sd4Q
 BHRe6WZg7l2dCnxgcVRDyok5Mg4vjh67yY29aebc4MCf5LcVKW5YURmT0pAlX1lzByl+PrHkl1e
 rF44qBAMHlS0J/z35YdAAsXrnOQKdPzJo6QtAhg9xJOaO8vDwTliivpUpzJ9V/q05S/TJ43Pzop
 g7/eTUXdKkdMgDcDoF5Xm7J+3/tBtEkaHFbnoBkFpSy4dI91fUhb6Wn5CGciX+eKFtmFZTN8gqv
 dCtkdeFiDmhgsmNfC8Ocsb8h6DILbwVsC0IpLeKGH8CbN03N5wJ/mnnR25uXcgyhb6ojzEKIbLH
 cyLEjIzQnll74QSq6vtG1mjajlYJd7VYn7O7CLJs3xi0sgbckOVOr4bFmujiYEw5QYSsIV5ouPm
 FJDWr42MxMjDcwL94pg==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7c78e6 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=GaLJoJCzB-nc6VTDBBcA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3tH-Tdo9ugthIjN8gwTY-s4qEBqDYo2O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120112

Add missing upper bound of number of resets for Amlogic DWC3 wrapper
node, because "minItems" alone does not imply one and any number of
resets would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
index da757c1155d4..b0ea8257e1d5 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
+++ b/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml
@@ -53,7 +53,7 @@ properties:
     maxItems: 3
 
   resets:
-    minItems: 1
+    maxItems: 1
 
   reg:
     maxItems: 1
-- 
2.53.0

