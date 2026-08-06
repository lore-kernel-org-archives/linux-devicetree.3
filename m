Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2B3436361
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009526; cv=none; b=uOVvU9U8MPoPyVOqo9cjUNJcA/T+yKUclsAXlSjOn2umUNXqwWofnEyhK1RCAjTbIICa+4/XPHjy2FqMbLk9q/KpNMT/s1yLL69nSBmo9odEQYzhM4NZUDs6ivgiizrPPmyxtyaJ5liBt+DHVpZ3xc+kRmWRzhdN+r6FyKEiCGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009526; c=relaxed/simple;
	bh=7jo/1z4cTdcF07oE+lyfse04saIp00Rd0SnF1icV6cQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3Euuxs/RB++TrcXNmHFD885w0imCOfmTP4ZXj8SRtT8M6brCso6iZjkVhAefBbeZ0uUOjwHhrxokCAIE7m7rMgzenpRQjwXlhf02OwvKkBONIc0V+s7zg2Ll+SvTeGW4R/9PYKN1mjxD/elGYHHjcv22tv02c/x4vNdtdiMfyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIJtOzsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwBkNkRT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIJtOzsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwBkNkRT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769epaD1605357
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 09:45:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eeaiICcMNs39Dd4i+kUOBQo1oBl1hLvDJUWmotNpcA4=; b=VIJtOzsCpuXoRFnp
	95iYpki7Py8BwzbzLz+cn1PXqxpNtHrhxj0LD8ACThxdvITMWWmsUs1AJx6yMJMJ
	trEMOi/leAVvAsD0SWZ2XWVE6A1oEMeUb9USU6vyhZRLCCEjD7QLnOwJszRBFSen
	CR3z4AU0wL4Aep5bsCu6cJOMs5rSNpM5/RdgpgOabYhbSlU42e5WTXqpUKNGIR2x
	YVKBqU7D13Jr906ve/WXLlkhpCEeKgNNIEjmd2I09TG4e13bHdvuYdbT5GJO4DFs
	sJ+wZhmDcUS5UAYOBRWLeV4JURtJPSoGhAlvVGPwQrUTyctP6H3H86DQ6kXhgOsT
	j5gcXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntngjpu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 09:45:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e55721a8cso188129885a.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009523; x=1786614323; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eeaiICcMNs39Dd4i+kUOBQo1oBl1hLvDJUWmotNpcA4=;
        b=kwBkNkRTptDsXx8j/iecMYPNJwxtClsBs9jGPOw5RBTDcdv8sD+fUcpfCwaYp9KnUP
         0D2J5YbeQ7yoz1i6gRGHpT48oNVZkksW0558vAlJo2eWzTgDIf+T+WWJYJdF02xDagNj
         7kspwnV0eU+AP7+PdouwG1f+UAY6xOHpcWY+hNTXDxV16O2rTUGpYf4SBAaBEca8VkfG
         1JxqGSHFb2A1vZ/fMp1k0uIQmx16OzHIn7jHmrMt8zWUpcmINkmp9MXnZvTJATV5dO5m
         1KM7qdGE4ZQnN2HshiLTJp7fG7HEHWEaf/Qemcd5sRtTmnkKYj14puVulF9fP5O7dWU5
         ft/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009523; x=1786614323;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eeaiICcMNs39Dd4i+kUOBQo1oBl1hLvDJUWmotNpcA4=;
        b=N685E76nba1V2W5bakAr08WZmIYp2rMWGt88FnejmpigQ5GNCsOSSdeCeb9n6EY/Mq
         2cs6NwnalMkJpZtM4dVDMI/S2RGQAkEavjMiVMcCLCgoV/loIEU+XaQpGbbsfEcL2qZY
         Fi9P1PBMfF+tDEQak7ewXp+/Wdlb4LgC0hX0FgjhDqJLJjGmfHFH/Nmq6Unkb7/I45IV
         7fyaZpMLkt4LNU8owTqhPFruI99INTCtDaihXVLKSxuevPTWrhsqAVWNqsKLi5bNrf55
         IZUecDDvEKnq83zM6a74ebpp5zMyiOUZPgn4mpf1ZLVIzWbJxm74Znl0lTrayG0hpie9
         ZogQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcnTPvJ2MIbWJNgl2D6imZ+qovSNhcunqRn3U2bZKC2G7kQMB3C6TOaDWaHzwv1bTXipOrUxfr/8VU@vger.kernel.org
X-Gm-Message-State: AOJu0YyPcgT4B4ByBhyy3raKufwAY7AR7Dsfrey25DWQhFcuypJcnzRQ
	2CqN0MxRK9IhFtHF49W1D3PQEB7g1eXhKqOiLTcxsu6i6ZiBuJgjqkDa89WXVrEbxjIWWkLaycJ
	kH5E3MIAfzbzLyIaym4G48ISus0f8rFc14Y00DroZuBTWH3QTPiQznN8EQXaudXtX
X-Gm-Gg: AR+sD1243UKx0fDY2z39snoTWekB9diyQ1QPfC/jkEO7LcLAx7doVuT6rfmDAg8MSYb
	4wtxZjqXG2hjlIScxhFXtGzo6txrHs0u5gLc14lqsd9ZFg0+/c3NwT33VR1QRLVnHCVTph8NWda
	UhBk76ALIerpKJyzun1Qa+Al0Uwdy+GpVp7q+NYVROuWbVUi9T+7fr3Pofr3Hwnowp6nqQDzVi/
	CP/ezW8JOA/GdDCz32fZh3Aq6SN+aggBWJwvN1t9f6XVbXcpKfU0dGXGUxUHg/9lxSx+rL/omj/
	Kvw1IRvC8pZY7BaPcO8jUwVcIn6XdxryDmL5W9jk4WL7yZ6toXJZPgR3J5GErge6hjncQxgGzmf
	Z9nInWiV0B40BVYSBa0vMnNtCFmrshLol5gOKw3ey4Zqe9XyK+OLqZxleJ6o=
X-Received: by 2002:a05:620a:404e:b0:92e:72a4:f291 with SMTP id af79cd13be357-93649269765mr1378661185a.35.1786009523462;
        Thu, 06 Aug 2026 02:45:23 -0700 (PDT)
X-Received: by 2002:a05:620a:404e:b0:92e:72a4:f291 with SMTP id af79cd13be357-93649269765mr1378657185a.35.1786009523085;
        Thu, 06 Aug 2026 02:45:23 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a570fa9sm358566085a.38.2026.08.06.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:22 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Advantech SOM-DB5830
Date: Thu,  6 Aug 2026 17:44:46 +0800
Message-ID: <20260806-hamoa-come-v4-v4-1-706021d4bc8c@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
References: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX0doVBY7xwCPx
 KFVWZcaSmztyMYbuevQcCuxtALjvkzkRlARWdyI6JlptY6i3YbOdno6NofR6fNAzoqRJrfYurAh
 KhMAPV26QcsjmrINQPIwSj1RtLSSLiksPq8uLVv9e/CE5A0fH5Kfi2zcLyOqvO8iXQfr9RfoDfR
 y2AH0MGddZknv/NymUTfSitycAahbdz79a/kfs+guzLDQod5Irj92RxhdwlKMDgXnDVhhrbqvRd
 md8FvfCL2t5ayp+tlabTuXMcPGqKy718YCj5UPy58i8Ot+N3IdW5XiqmOzuHFjEum7eymoUNnh3
 GT7n7ACfUpg3l8t/7rRRPWqj58rGaXluSM7tRW3INiUpZoZ7LndCFrN4i8tPL6hkGk3sA3j5+la
 dfSliFhdtN7Am40hkM84KbnQrJjyBHP5mG+2hkUpn9x8K/Yg0hdNjvtpZ9jshQAgZz0nhJTsQgF
 LQzzt4HLBJP01+eGMpQ==
X-Proofpoint-ORIG-GUID: 6ozST2kBR9pKUDmFM7GyATarw_4oddz_
X-Proofpoint-GUID: 6ozST2kBR9pKUDmFM7GyATarw_4oddz_
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a7457b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JItYRnRW4wSoxD4qVAwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX8rpNuLTFBwwW
 PJF0JMoCMMZ8DOw6fspUdtF16rgYcnKnW9DHZGlPuUB14rjQnoYskGmQCK5GV1XeH5wNvfRVlE3
 K9ih704hfyY/ocbGWquc0kOGUua+a2U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075

Document the device tree binding for the Advantech SOM-DB5830 board based
on the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ff8a35df7862..5f4d49bafc92 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1223,6 +1223,13 @@ properties:
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
 
+      - items:
+          - enum:
+              - advantech,som-db5830
+          - const: advantech,som-6820
+          - const: qcom,iq-x7181-evk-som
+          - const: qcom,x1e80100
+
       - items:
           - const: microsoft,denali-oled
           - const: microsoft,denali

-- 
2.43.0
