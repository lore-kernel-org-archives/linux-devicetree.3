Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE299483BF9
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202922; cv=none; b=oSYuUkeD+WO/h0ZetwmT8DW4PMGaVRdSfVxI+kJhTfDmIAWvW8Kwj1Bd7O7i4IiX10jOOmEvgDZtGUsRjbHcvqOY1SADrH/GZ9GvkHYt4cOvVdA8EfUqctFbgaNahKaYafJOUEi+PAhU4XEVQGhJbl9EMbnyhO20JHZDeJ+W048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202922; c=relaxed/simple;
	bh=xbR26F+2IK0SwAaQUmAO2+Xe1VwKVtt+NKXks4bobiI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YUJi+cDOFxpp7WrTJ5VwEREza9Wj5gmTHjQcAR/ZMkMflS2GFP2VKAVPzAU/GAm1nubRBrtk18io/6H+xaF8yuHmnasuW5Sz3RWs/YLwPx7wG9rDoCn3xJ8Uc1SkBPdUiw3+xgchGFtI2TGWsmaMnyVoixIevzJxncziTtPsfVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ioHZLbTk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDvie8WH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ioHZLbTk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDvie8WH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFR4G1925828
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=; b=ioHZLbTkI8HGv28H
	tNE8ptOu9b5+s59oYIITySvzWwj5tY2S24RnKztunJg8SeNDEFBvRiQh0li6LWsB
	3VdoHkyRU4mIgHljog+f3M2tXUyn2M6QPvAl0abTpvkuSWyzm811fCPoTyyuQTxe
	rQuXaR0x/pZ7mMwU2aGe7JTLdE+RbQejyRN3qkiGlzVlauMBxzngl/Br0BUuiqmF
	zXfKXPNvNH7igZRGtBXHv++Zo5s0F7Ad5HEe2huz2tz7MiXM82m6XArMlcGRJAXN
	RtnVxV6RwFZC8W098RkvT0w47mLbK+J4mzZypAVZBjkHSTT+IcaPNS8r/9VABFUI
	ugJFpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h3xgyt1j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:21:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46b4b700so299653285a.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202918; x=1791807718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=iDvie8WHK1AtDSaV7haK48Gv8S47yGjzY/83q+OHaWyvAN8+uuG0KpGA6veR6eGLOo
         zWcOZK1fDaIgwhqM2EiQeVo1ZApPWFC+cKk5iHO8L3p6hFBgUuwg/LL3nlQZg16A81vd
         pZVwcVpqMXb2Ukn8zupGWyNzC0OPW5fVnLY24Hu03LMqtM+B4YZPq+7RFfXTo99ilPKA
         5tTX4KFLCoGJY22o/woI32I4gVryp/itKQBOumSrEb8B5w3MnMDh9XfvQcz1jbGQPBVm
         CRWQPoVU9ZNZ7B5Cmg1PylhXAXACdxlmPJSS9Reg0Uc4ycO2uZOkVdP8Zhi9nglNLWEr
         xUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202918; x=1791807718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fdPleMKS2IC93aynK6NEkJ3p446vokYhvbwvmK8b/Kk=;
        b=UIb4zcR+Dm6Wv4KOGIAqWP9y1KL6G3uJ0rKoIOqw86S9ZASDPPEUAgAVyy1BQlmyar
         kREJhcRYtbeOm+p3YVGugafqheYXvgq3uGEEbDU0tNc3j6cPRarN33Oi3kB5JUvGQhe4
         1Pos5twGMPHb6TDHWaOsHKXmB3FNSbP9/Y5wXISrSOaEk2vkM6DFX+MERiFrgIZajLNA
         /6Uuedj9RcRud3cUlXpkC7FY0CJJP/lGgHey6QMriTXTZ5Zllvmb2LKqfqixL7Q0aTB2
         2S1EKm+24kZn2uKky1stwPobc82TrU1gvnR/w5iuYNpNAUE4S+2SdKBWkPhr5MRIBdwF
         oLVw==
X-Forwarded-Encrypted: i=1; AKwUvBxvt9Y2FM44aPmCYROZYvPMaazUeY9TrKPmMW24lF1aCgKsLfsfvmW6kONZ8lfkKkVazr21Pcm2N2fY@vger.kernel.org
X-Gm-Message-State: AFuF++nFwfWxhJDV0ilA6uQmzLaOcN1cPGqNXESLbC+k89c9pOBy+Hti
	GdC4ppp3jiz15k5jstnP45pOWicfkL7iaJhLm8e1bcKKiIm0mDYDWbZCBifYXPgEAvBooPGg2C/
	w/HPsSvH0Ah2d9Snzy5wsoxJHYt1YpoNlfI+Zx+umOIguT6C5RtylxHA4CY8V2zvL
X-Gm-Gg: AYBFou0NubyaRmBKP5ARbGFB4xSL8YQPar28YPXLleQZ/FhTR5BEHRPIIltIDWMwWje
	Iuz1h5qhdY5hccwRpvpJyJlDPjL2ZkhvZdoYtM510QJ5Hl8/+KTxgEcmFiiMPoyqhTUMjJV8lHX
	SMmmnwMuNJm20+8VOQs0UewY28LAE0SKj+LUKaSt6hXl3jTazJzFq5pFW0FZNvbPkVHD78TnDon
	UDW5QVDcTIIZxEe41nhzZaH9ovbJti3UZg1Pwc0w3VI5+h7GVvSsoXgvI2jzq/feGthriuZGhaR
	y5cCeTOIzwUuEs9ElfIvXwVIogVPZq8SGRwRAFO397sTYYIk0IHu4DUPXHbgYU4Agz0JwRt0S1+
	B9IatDj/a/m1e+w1AV0K00ikc5p/8kKTH1Uw2x0OQW3GtDubqTGCvw7S4o/XlZOQuRrz+T/CAsT
	f5j4kuQKJzPkU5DU6qEzxK2TJ0W/uwiUZZsR98UBR7+5yM3KSvEp3Ntgo2IvSr9b5zFvOQNw==
X-Received: by 2002:a05:620a:414a:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-93e510cc94amr1222902085a.60.1791202917798;
        Mon, 05 Oct 2026 05:21:57 -0700 (PDT)
X-Received: by 2002:a05:620a:414a:b0:93c:bdb4:2be7 with SMTP id af79cd13be357-93e510cc94amr1222897285a.60.1791202917216;
        Mon, 05 Oct 2026 05:21:57 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:56 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:37 +0200
Subject: [PATCH v7 7/8] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-7-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: XX4uDBbUTC3uRsy_vZ0SFnThCj2K5ZuC
X-Proofpoint-ORIG-GUID: XX4uDBbUTC3uRsy_vZ0SFnThCj2K5ZuC
X-Authority-Analysis: v=2.4 cv=A6b5rKWG c=1 sm=1 tr=0 ts=6ac39666 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=M8sXMW5dAYDte-7YvdsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX2DV1kGakQ4NK
 8iDX3wP88u2oiF95JX/yaWF9QSXQ3AAqACIAGv/8E4OBkiBwRaPpuDtPQPk3CNrpW9I7IL/SDGS
 ch6542Vzwztpav8ItatVR0HZrohWqxtdnarGpHPjz2hS3xLWTI03gZWN8bbIOsaRUcUchHQ7YJv
 yIxq5ggmp4yDGfvqlhWg39QcDMfFB9WWESaIZZQlY8EizI8Y8lZbnILiltxv9QcrOt8TqlyC8NQ
 wxqf0ADwDMujGLkTKX9VQ5Jzip8ir8bPTC1vln3qYrdp7dJ19ZNKvsud8rOTJhVOhcwrerrPigF
 YnB4tgHs4aWMyRNKkKNUq0UVzw0o4eBNaYQhXPn96lHEkKa/anNqJqoi60zDP4HlRerbGN6e4U0
 xXaYjdSyD8FxKSlJ2Y3EIETGe/jvnLZaIWeEVx3b3wO5JuhSMn2XNHp/CX3ZflZn219wHRC0gGI
 sJGcnFtGk798Urh3+jQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX8bPwTF56clsg
 0KN4sSVYaOjVjmN40WwiWyQ7ZotT9K0b/5Bx5pVzASz62a1uMQxtKvhD74xLUXoQhlXkVof7yZg
 yVRoeXszqjnkx+RqLPPF20cntikPPaw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
Key E interface signals but are physically soldered as an LGA package
rather than plugged into a real M.2 Key E connector socket. Such designs
are not actual M.2 Key E connectors, so describe them with a dedicated
vendor-specific compatible while keeping "pcie-m2-e-connector" as a
fallback for the shared signal semantics.

Add "qcom,pcie-m2-1418-lga-connector" for the M.2 LGA 1418 found on
Arduino Ventuno Q (Monaco Monza).

Add "qcom,pcie-m2-1620-lga-connector" for the M.2 LGA 1620 found on
The Lenovo Thinkpad T14s.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/connector/pcie-m2-e-connector.yaml        | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
index f7859aa9b63469cb43919c0b5719c18694c5364d..ce6173a0ec41cfe8ab4a5780940999c18674ab7e 100644
--- a/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
+++ b/Documentation/devicetree/bindings/connector/pcie-m2-e-connector.yaml
@@ -17,7 +17,13 @@ description:
 
 properties:
   compatible:
-    const: pcie-m2-e-connector
+    oneOf:
+      - const: pcie-m2-e-connector
+      - items:
+          - enum:
+              - qcom,pcie-m2-1418-lga-connector
+              - qcom,pcie-m2-1620-lga-connector
+          - const: pcie-m2-e-connector
 
   vpcie3v3-supply:
     description: A phandle to the regulator for 3.3v supply.

-- 
2.34.1

