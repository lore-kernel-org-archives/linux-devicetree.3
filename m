Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40BE3BB13D
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784623676; cv=none; b=gDb0jS9ascRzJjN27+31mKty1IeUVIu6LIJxEM80MP7XUJR3MQqH3ty8XDrbjI8KVpu3Ny21GwwELAxSWPwyMozOGWVK62TeXuQ42sAYBOByh5bMZMpvpZZNRULbE3zf/g9xD7NWfG5yLUyUMsXWK4AV4EiyhXwcPZvlp4N3htk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784623676; c=relaxed/simple;
	bh=NNCt0N0t41VRnKjEySgkYUHwdTuRokTpy+IVDUMSGUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Sv41xu2/DRPiPB/UeO9rZNTIyvXjPz4Y3zlqenD9G4OsAMFnoNk8QU/9KtSK3bUMjZG9F942lHc4Rbiw+6Ko7rQ2RjHjOQiaWLFsws10LQWktOsBRvzeQbXr5EeI2Gncr+sg6EglpgCPWsyRT/oEdGeYdTiAw0AxFTrz3jgOyCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HzddKTau; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+MJEPv7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HzddKTau";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+MJEPv7"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6aGJF4150258
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX1
	6H7AKj3I=; b=HzddKTauOZTa1ofO2aUS+ejh+prI/PdxoaRz7djuydmYXHcCkSD
	3gL2XfKrDa5Ae3EmgBS1C1k0Ip37dTrXZURwC3owxTmUC4T4mUvnoALJK+ybaZBx
	1VYE/dEJdiq1IVBAX9/JF13lQPUg1RCkNwQ6bZ//7yiyJDES981CqgXtb1lamiRZ
	8+X2tI8wOZ5Jkn5xebnllyvG3SZqioKjJ/A2Y35VoX0wPOxpMnxVlX2/0dDiNQvk
	h/HbSpzH3BrtDYqBF4ffrCEJI9hT4T5unvJWvK/yn9PecXFSfn3AKzpfda8xtYb9
	RUBWGqxfY/WT8T1qp6ket+np0/xKWRaWWMQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqff3k48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 08:47:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so97146721cf.1
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 01:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784623672; x=1785228472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX16H7AKj3I=;
        b=P+MJEPv7qG+c3HDHhm/4BuKIAZDN4gqMNE2+j9jtB0WE+VHHHyPXr/HWUqTQarDm4S
         n5FtB3o210+yM8DuZGL2q+Ggw6xe6xCJiJfmtsUX/7IyiPyEJecaMY1wOd9GWr/dI56x
         4tbtMAJjlEIigIeowpvr++HPathr5u9EKPcEcBo81S/pkGXl2pg6FzG0o3qowIL4/cOy
         DTUG1O0WYJCG3HJnip0zkMFe+JT9BNmj+bRZkH47HW1AB8RtbKcO9JUbmYX4yllny1I3
         nu0VHKGkbvu3XaOdaqdfjJYyzZ/d/NFxkyibSJ9o+Fr4h5vZ9hTQAVQIPJjt/DBVhTOu
         zGcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784623672; x=1785228472;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bz/o7GZt0RAUpyQalP0SaR28OjafUP06pX16H7AKj3I=;
        b=MHBmhmwfI2H+Yot/qwUKhUQIkeQweXShQdgNRcUZr3gbTF+f4UnaTbivo5Sj+7EEAP
         /nFD8w8g9pXAYV0mazBHCNxxKLDbaMAzeXaNNMjdZ0By6aInUPwnMHt2enj7L+lMY2F9
         YAcpGDNJhyK3aR58I5/2LxXzr25TLTCXfySyd+2iIztRM+jCs7k7tVIedUuXIIkPG9ZE
         Oe2G32RmpuHb5WmPhzssAfF9JvlNi6bfxdWSfnVtTXDfek4r0yZvRI/zcvKv74MzQq5e
         GC3ED+Hstlc6JMLaQQHm54CCRGolAnhf8YhDNcQ0LYrWjUIweCq2FGN7bm0/vbdqs9VG
         jsAA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3IYhuCKoE8BGJfWwSMggprM6yPOGzsEOgBFHf7sNmhTM8rOA3IUoPjvg0CGhumjUwADiNo4JFSofP@vger.kernel.org
X-Gm-Message-State: AOJu0YwUkki3JkovfEaRxfnTBDha7yoZSj/49wRw8A8Rsk01KQ9tQ8EA
	DWZw19slvaqO/A+WvkYLlc4GDasuKGOaRLSSJqpmZ0PG1K7bVEoiZ9gpjJ2khGm6rZnBf/pb267
	83BVkJ5fIXmRJw1BqqhIQBKRHoQA7t3qSu2Gg/mNWiK/v2I0T+6E0FVhifFkjTzML
X-Gm-Gg: AfdE7clJ6NXaOR6myY8WGC1rNE0siH7gNETZADSWewilL1CDertuwjPWdc2ew51im6k
	T5y2Cy4BUEJ3NcWkC8juzgM2nsY9qbZLIlKcgJ0Bjq6EzrxQPI3lUd+/bFUu1xYTRULprg6WG82
	U5TAyaHzreKN+dbakTYMpga39VTlE4T5la1dulBIh6XTU0nHAxurBW7sUFRQWUzugwlBKsINl52
	1QeETJM4OipgRMQC3QirkTVcF7pIUQDkBlchiSWs4y9H/uGJz10fdXxoZ1xLjFsdZvNvVer8dDO
	XCmyOYfHPmM0kwFhimLMznG3Iv2M8sngOlDYd888DRqzq0eEezhAPkKQBAElnyjnlOdpedsxJMb
	6bUe7Pf+s1azT0Qvr
X-Received: by 2002:ac8:7dd4:0:b0:519:8998:661b with SMTP id d75a77b69052e-5213c7e6a17mr166080531cf.20.1784623671891;
        Tue, 21 Jul 2026 01:47:51 -0700 (PDT)
X-Received: by 2002:ac8:7dd4:0:b0:519:8998:661b with SMTP id d75a77b69052e-5213c7e6a17mr166080431cf.20.1784623671447;
        Tue, 21 Jul 2026 01:47:51 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c9d99sm51140295e9.12.2026.07.21.01.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 01:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: remoteproc: qcom,sm8550-pas: Add power-domains constraints for Glymur and Kaanapali
Date: Tue, 21 Jul 2026 10:47:43 +0200
Message-ID: <20260721084742.59571-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1295; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NNCt0N0t41VRnKjEySgkYUHwdTuRokTpy+IVDUMSGUE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqXzIuGunWDjbuXlSYES4/0RtV5uLuwxBypBZnG
 oyDfPrUvWeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCal8yLgAKCRDBN2bmhouD
 15TuD/4ozauPqc/fao0LAgR6c2nwoA2L9Ew9zzusxBcdeiHHquGhemKH7nxzpPZjM30Gx9X0qc8
 C+ZuoFkGv5X+PO50iJgXVjdK3fHXUegMYAb9iD9TOy/Ch6i+vjATwrOvRSPrPoDhuLfjZ6kvcl/
 Yh/ZdeI28AaAGw5ceclDIvYbgUJXCEtV+iQ3bm68qVkctv6QFm+YzCXGTf4QutGBqRbJRVi/two
 QRnsPbNpHDV3lVDh+m8dMRiGuBFPRlvy4eIAFWlwduTGp8P/uZScMMs8awoHzEnIDqQSDcEAXch
 24lgEyptMGylhQWVYBImoSt28ec6jEQkpYLUfOSt6RxaIXObV9lOTfPp+6AMaCczc6th6SFsrsn
 J3wZke78N/rnUSxO1irSfpZK0rhSziHfYMwuAHn4kkUOBBzkpIy3G0exL9LzHhij2XYnjIDfy2T
 asc/OQAPcNz2ip4V0qucH07ahRHxDfHiWdV90LUVqV+M95cDRNeB7OjgNSB5fHEHfSbAa0NfUnC
 /wHEOlzI3Qv84WlY7h4StL5QmeyDtdsIqHoHqfosVMQpxpbah6+srTePIebsAkQgBrMU8r3Diff
 7Vh3h2tiMsIAhPPJfglWkznA/Dc/sYQ+cjCkr3sAA7YZVr95NHCYBhn5l8vjimh4fPUIP+9WDfN cl5KS+Pk9at3rpg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5MiBTYWx0ZWRfX0GI/QNj56QWm
 6bgtsjmiQCfFuPJxpqCAxnYZOUUwVWmB42ubtIR0wehFhyyBBzDgFAjX66Q4FrhSCJO5LSmZevu
 XcA0R7kEG3A2aiXsAsfmtJkPV3SVJPc=
X-Proofpoint-GUID: xEjGGeQ3wZ5-9NRIghdE--AbixT6ekPJ
X-Authority-Analysis: v=2.4 cv=FJErAeos c=1 sm=1 tr=0 ts=6a5f3238 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=qxqRFaZUwwWtHnsma1AA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5MiBTYWx0ZWRfX71hDa8EqFsgO
 ZrMBbttjPqqgxQxJc8BFfP88Ej+vdS1go5Dv092RY9/HxjN4SYgNXq8Tc7UwsVBa1a4AvPM+AJm
 WRLIiE1iXZfe0KcL73LIs4LAZ14BY4ZaCtj5U5gm0L1Wd3J4nruuPj2MENO9B3ooPgHfLP1KvwU
 y8ZCfhzWBsb5f3kgA+6kVlP13izL65h/FLNQ79yVBwwIk4HtzroNn29OlIW0QU+0r8lWhMzaxa7
 MvEBDcqRFIXSGNbfBuqzflWDpK5oT/d8fPfErb1Xw5WrY14S3KE7wkqskYy/gbaI3vxd5Bjbgqg
 F/8jxQF6NveN46OnYApoEhM7niRMHvLJW0aYZcpJdVovzpdUkpcVPb1MB2xu9djC98TS3bgreoT
 iZ+MW+fUDo91TrrpVOliBeOMQgQHaIwx/9Dkyb1q+vd2qbEInf3q/bZ5iGzGDYvhKqniB6iq51B
 KzwuLgZI30tMDQhpT5g==
X-Proofpoint-ORIG-GUID: xEjGGeQ3wZ5-9NRIghdE--AbixT6ekPJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210092

Add missing constraints in "if:then:" block for power-domains on ADSP
and CDSP of Glymur and Kaanapali Qualcomm SoCs (rest of flexible blocks
were constrained already).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2a4c527552e6..b6bd37e4b8c5 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -232,6 +232,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-adsp-pas
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8550-adsp-pas
               - qcom,sm8650-adsp-pas
               - qcom,x1e80100-adsp-pas
@@ -269,6 +271,8 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,glymur-cdsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.53.0

