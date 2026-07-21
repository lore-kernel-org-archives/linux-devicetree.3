Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52546399358
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784643625; cv=none; b=GaOV7L9JHzkwXPHPjtiBzkFCnA2Cr4f/5BPKzxvHCPKU1dzvThVi+Ca7pJXMVTt6GOpgzehwvPfoWtbE/uwJX8b6tW80RDi/2E1e9ZP1XZzLCACcW+WvNF2LFN+7kbsxCOoerJIotWzhZ8HiAsAX/Zp98VrGPCKXxQKrazLlaGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784643625; c=relaxed/simple;
	bh=fzzUoa+Dil42p+lzeQF1+DhscAcKEl10Z+qImcbAWRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KOhKXPlIqICEM+UK5Hbo4TUMr9JWPX53A9cim4i9n4YJn6h31vWTZoKO70pPmP9f7Z1mqhCevne0/W4jpyA+7RTudiBBFq4u1gzhvTBr9uxE5jh+cjEdEq5iBxGmg+93px5vIVIB/iVq+v1pVDEvCd1LZKq/wSaf/2DS63WAA5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IN1FlS+7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RyysXIyt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IN1FlS+7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RyysXIyt"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDg2hV1958614
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	94RrMYvNCHTTzn8WKE6y5BR6VH6CzIa62cD5ClQVmRo=; b=IN1FlS+7CNgOpXdX
	eNQAICpKQEHA7llrcE+XX8TCKq+fIwyckjkoFBZK+kuI/8SMwFN4Kew8El/E7XTB
	n1N7DhvIT5rAI/CB8pkWPScmxGg8Q/shjIuWnKcnd14yl1pppQ7eLbMNG1iWAs8u
	OCQcmVzoRC7DET/a6Tx9xAWiV0Ao6IQtnuVXsnYelBK+ZfQSHh0DwlaXgZNO7c5X
	K1xR5l3iZy24tqjxDGiih7iJB6wVbO244ps31aqz/DSs+RS1Hf3o/ZW0qRGHvy2F
	zuIfZOWIUb5jbxPYBQE9vSrrax/+51v0uOsg/ijt+nsJy9GMNKW6k2cEQITuKfoa
	sfJZvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1bvtuxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 14:20:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso166149281cf.0
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 07:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784643622; x=1785248422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=94RrMYvNCHTTzn8WKE6y5BR6VH6CzIa62cD5ClQVmRo=;
        b=RyysXIytwc84Q2tA6xUUuUgQQV0lanbLqEv8A62sNZz/Q8vZbefKv2n2ylESBlkfGz
         E+xYgwXkm7V6viELeRl3Xbfrx6rWwvEAhnASgTeRuCGtrbFRcCQmenhMtFWVp//bdQaB
         8W+bd2WKCNrMZ1oCsBTF6vmUkesbIzvo8YM40/kRPrtLZKvz00ohDRpxbxjP1K6sOi5K
         kujzw7uFk4q+eq7kV/Bj08Mt1SxUx9WIowcY7aTaTlgDsozcFE0fryy7SoAKA98oIFgy
         Hwat0z0q3TOoXcrwb7oAdy5XlGospmghh0nYmHgNQnldurc76OZRKTfkGz57nvbA6mru
         tUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784643622; x=1785248422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94RrMYvNCHTTzn8WKE6y5BR6VH6CzIa62cD5ClQVmRo=;
        b=HYEsSCYf5W5oeKK+Lc68Ui0ZoqO07l8UW8RYaFATJh4pqglJWS6fRAhwjGYyYXJZxw
         Hgxrj7RbRQk08cATRbbTbMeRuf7KmYGsuFYX6PnEFm05D+KX8J0wb5Ghcim12KD/cC1l
         rCHlZLm/Z/AjA8at2M322wluIfMMwqYsmaZZRhPB/T84v6BEjsjNCBUoZ1LP1d011HX8
         1EGEym+IompQdFZ7mGO644zgo5pd2fvVJVQ4TDlqPsT1qg2/2nkBCXh5FpqscR78gzEd
         kaXzBAsYIkKCelfkIjReGGHJXoKjeBWNf0quvAXQr2KjxXf2FuTm20NcTGhdJUq2dobq
         6/VQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1zcHjRRXD90bbveSdwvsboze6LIow3QVqlP9MumOk1nAqKHl9ADuYbilIu+/2gsDRl5byJsXpYCmD@vger.kernel.org
X-Gm-Message-State: AOJu0YySBgZvb3wP/Y2ctRd0aN5RZH+0/ejZaRwpYR45Gb1XIisbc/+e
	l+mYs7vuJ+zQLjhRwFcuRjFhoQTKQGaPxM1qJJwazC3lz9vTW9k/sSQuCk4VN5t0Y398L0ErYdj
	9owxSNPXPH68N2AkX2EC/bjNqwHSdjvjEYVGwmu8T2UNJpejoFiCKw0f70O9a7soo
X-Gm-Gg: AfdE7cl3yYtIHG80LhWSXfvy5BGaxrqzhSLaZOkio1/UKOdR28iYSQKPUwFnAVdqR7W
	FUBfoprOK9qHdXBZxEGi3UtInFIF9PqxZmMlIraCnt9sXb4cA5S5ZR6oXslM9/9iAMhCk1FlJLL
	mKSr7MHVa6vyoWVc2esZpJd2FgySDZ4rgpLDDfeXnws1fGqottop639egpycknOd2uNF5i00eoG
	mkd7ZzIpWXeBiyxUsztP6zQ138/addggR4YgFw+T+x82xwzy6D6C5uSMaBBJ1GYnu9Gp2f5WedT
	LwvqRUmMnzdt4wLJ86rWJW8jbmfo5BhuxiUUAaeQG3ABZSkoC3/CxDL894JIhjrfqdzw3nu+xbG
	jBV9vLVmz
X-Received: by 2002:a05:622a:2618:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5213f66a697mr179312931cf.50.1784643621349;
        Tue, 21 Jul 2026 07:20:21 -0700 (PDT)
X-Received: by 2002:a05:622a:2618:b0:51b:f40b:2fac with SMTP id d75a77b69052e-5213f66a697mr179311881cf.50.1784643620475;
        Tue, 21 Jul 2026 07:20:20 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653687b2sm84762025e9.1.2026.07.21.07.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 07:20:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 17:19:57 +0300
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: Add Eliza
 CDSP compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-remoteproc-eliza-cdsp-v3-1-557b5d02fdd9@oss.qualcomm.com>
References: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
In-Reply-To: <20260721-remoteproc-eliza-cdsp-v3-0-557b5d02fdd9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1683;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fzzUoa+Dil42p+lzeQF1+DhscAcKEl10Z+qImcbAWRg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX4AXzb6Ega1Cr1KJnFqgFaLQ0//oqditlPGUj
 9VHo8zDvXiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal+AFwAKCRAbX0TJAJUV
 VoSAD/9A64MdJHodCYZSnSouk2ZJexs6P1u0hWdgHANyp2uOQDAGnS8nQAuBHc0GAUX4K3ILWkD
 4cqCKDLqIn8XVhl/CXLvwE9f7Xz2wymTqBjOSDV2MFp6vfBy84epUE8Dd7DR6nJmsonztdcokU0
 OU8YQ7c8Xd+idxFYs3F2D4Srnijf89LAG3zGK898JzRyefTO3Uuw7JraKblj156B5+zEFjGUNLW
 y7fP+6JO9trSubnyu7P2WcsS6UFODqbKcHA1o1PR96mgIN9MNVAVP39/lvGvWHuOPC/Q90HrMzM
 SyxaWGZ8cS9Q73M71SgF/FwjqUfeQuC7LP3aD/FiRMUyvElYcXgXzTCg1uOJ+gkvw8GekcmSpZ9
 KAOVk1OHt3Pxma8GkZU2TV7JDyl+LTuO/00BQjIat2DXLarhc86fPHijFThpanc+zVAHw0WNcGl
 QjMPWqn827Hv3YHtBxHGdsm7HbPf4lRlo0iGFkzOUBGDMFi049TR0cJK9ocpwKrX1OkVA5SqsYE
 kOHoj8vWR8Wod4514jJGyLJ8De/EGyAk1l/Ts/RC5qt93+mA5zLZmH7FUV/qi3XV8FOiHDMezr3
 qeq30rKjp0UIu8s7ZB1Ve0HEfUuBKt82YyVSSasN0EWH1SN9QdQ3qoo9RkhmBGxIsW4DScZXuiv
 13DEPt+ybfkJCFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: WZ0mqxWwt9RPXuTR4FVdLmm7B_Y_Za9t
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfX8EnzVFRMBbra
 0J+HH3UyVyNpfE5H8bVoJoa0RRHZri7hBYHXU7LDCOLGQJICbZhCVRknP9pS4Qy17sZnDFO2KY4
 TI9bTRM7MztLUMDboRjrGJk/jQzI1mE=
X-Proofpoint-GUID: WZ0mqxWwt9RPXuTR4FVdLmm7B_Y_Za9t
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a5f8026 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=ovmeWcPxak0IfAIrAdcA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE1MSBTYWx0ZWRfXygOiK9WL76su
 r671sEApFz7fbmwId6XVXqKlpGPk9ZVu/LlsarZcn+2OlSILEjh9bTE+QO28aQNEfb4WXe8g77Z
 l+oamzuTSXs95IT071U5F4uNc1Dkq0wBj4N1IPVnLCQF91FdYcWWtuMaVNGYN606X5eJ35Vs34p
 SuVkzlGy/C+GDJieFKlchERinHXN/qK6pCm1xig6QZJcFNjbejTMtpERXVp2raXP6PJCzYe0piX
 IxJz+F47ag2Eize/KFTBP/sQveIHyR4IOy9nYoDnPISdXeyGqLU5F+riz7tcMSMnzXifNyhJzjv
 MBk6oMMqAObi7VTmTvR6EmxvZ+w27flXdCA0SSDSMXngjdDSAlttGIVXWIWZOay3o8S62ujYTWc
 iiyLuJjHiIPtWNOGRXqhBPmsC1hy3riAIQUqd7e7SV26SvxK/xBb3kx8TyP3NoGKEK9OTAbPUIP
 atBr4QvnWbsSArUc7NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210151

Document compatible string for the CDSP Peripheral Authentication Service
on the Eliza SoC. It is not compatible with any other.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml        | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 019db91be7fd..5492a88bb100 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,eliza-cdsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -173,6 +174,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-cdsp-pas
               - qcom,sm8750-cdsp-pas
     then:
       properties:
@@ -288,6 +290,25 @@ allOf:
             - const: mxc
             - const: nsp
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,eliza-cdsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+            - description: NSP power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+            - const: nsp
+
 unevaluatedProperties: false
 
 examples:

-- 
2.54.0

