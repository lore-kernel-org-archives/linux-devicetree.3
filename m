Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D734A0EF6
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052833; cv=none; b=RgiK12Ndsa6NlE0+c8ZS/1caEMmuyxjyaqhK09leI72DMXxJXNel2nxjORx+LllnrwNqin+LHrND9u/Mfc6bDPBjRANbvjMU4vcVHVuNOZs+kQRweJ2Dv1TTRsZs+EQesocxOzsGaGn/PEb2bQp/I5PG5yTtsPU5WW8iriUMay8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052833; c=relaxed/simple;
	bh=IoRE54hligUVN4gRAMILtyfQYGutGB4mIpeILT7bp4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E6HEZa1LdlQ/W07++bb2ScMxBHGrJ/drTrFIMQx2W5WjvyQKoY54CFR0bIBjnzV2ERCggfNrPHm6V0SwkoNteeAmms1gtLM+7tB1fJMs7Cf3mI0DnzqBZswyYuL4tlBtDHzlGNxzpb+3UIZpdNcHq5A3nqMX/1M2fTp70ZyKH80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QYbUw7tE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GkwuPD9f; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QYbUw7tE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GkwuPD9f"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4LAb1494248
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:07:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TtYH6OpyomO
	PlQjGIp+EyoPVGRODOWoTGcxWfigai80=; b=QYbUw7tETNC97VhgOd7fxNH1u0O
	/EwtbChwr/Xcg8IP3g3NIT0/x2y727fuLbzXtM7nzyuZvZNJb+YyXqWA5ciUUb0Q
	iKiwqyHcnd2CFx6lFsYZOPELZj/frzHqK7hA0sBwI7LGEDtbvUnsvUwmNQXdujjD
	czOiM2Tyc+hEwndu1eeqyzDv6oNzoDg3jUzjT7Wz8s+YLorSckq8zaHxLcrXPfDd
	dIQ7sT7BDYnwlEJPLlOx2huub1DvN9/bNPkJReakF71szmDHFGdNOni9BbZMu54q
	1xbgDkuxVFcdKwq5cc8X8WTxAo0fs3sOyLsrtQInHS6H7JhmyWMQIPCRLGw==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwx9rhhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:07:04 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a41f46d629so11976721b6e.3
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052824; x=1789657624; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtYH6OpyomOPlQjGIp+EyoPVGRODOWoTGcxWfigai80=;
        b=GkwuPD9fLYqQgp3rUvTxKsJD5oXlHO+/BX9IumRFkRoXaC6SAO6FrpGALz8Gb/UP30
         aP5o3tvlC/oWElRdT4QZjyvHIGeEesSvPLKyLvgrIA2njMzlPnVHijQuINxR20CqDzrM
         gCH9xD0GmcJbNSf9JDxVY/sluQhaHKHsyMdcuHZ+bxZVScqUBEwbW/YTDAPJd4mGCklR
         brHVAMU0xwEgj278qhPY/a3R8SNcT29jRTEXX/a0mws0cJHkeU6YHMETEDplT3/n+6BS
         yLdEie98TSCk4iTzU4lqKpjnCWWbTA7YgBOOk2PXDv7pXipHe37UsSvE2dVhxJuRMetq
         uNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052824; x=1789657624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtYH6OpyomOPlQjGIp+EyoPVGRODOWoTGcxWfigai80=;
        b=RtQ13Yf8VUktVtvZ0Yap6B6sKAuFjlyL9VD1AD2hdux/+M17OYQQPbv5QZX0hgZqaj
         nElmGo2gpTXCppjpAz/AyUs4BU77gTtiYbzXg+tfxRm+VBPT1ztRAbCzjtH4lYwm6IHA
         vYVj912p69oQankWIgOJYRWK64U31fOju2G02+2C5GtPNRVLYi3GQOfP5AA6pW7rr2h+
         CQKJiCu2GsVpm77YHBdCZMXpyMA5pNDs4Lr3j7Df1QKO932SmFHizN+kceOWhV0SlD2Q
         CvAg314/CjHr5Tq7CKJ/dI70wbZnbV8FJHrw6sqeGrEH1s/41HSG7YeRNNgxmfS73OuZ
         YPOA==
X-Forwarded-Encrypted: i=1; AKwUvBzBpwEnXekZkRm188dC+iiIVVKjJbvd+4uPf5Q5Jpd+z9x2+bME4hvHeRbfGefUEEF0QN0OSpW+NCOm@vger.kernel.org
X-Gm-Message-State: AFuF++mXERyQsD4HhmC74t/JkYUyD5cJs4iDBNk+73Da2xu34ytfUlGM
	CR8hMfpOUs83Clms2H0a4bga7E8z6/n0q0vWJGbMjWVRzsppgQPfrBkARsz2EZFsSPwn93C8myZ
	8rm24q5q8RwSgelhUeLLUq0jqh1EpN9PUPpQv9pp7zlvZaJ52vRmO0HiWiNSqgMCQ
X-Gm-Gg: AYBFou0NSH9ec/gsDWiPJK6elrvQHxe69hNM7F1zrdofYNlMaTrfEzVEizo8LHbhiTm
	TjfnYebK3x2xT2ScjpwDyBc9cWzX08rw2kxHWuerEo0cRbmJdtqf507cRKkq8uvDdPibpeurhEa
	gasxjx7QNZCy11KMeihk4iS5rFx7CLgQYXqE4ZmiGlUxbsmrCCK9xUei8gDLZps6Q++uES5nEeR
	IY5aTITe2A/GLcwJUYi7AnouinnlKwTGlNoKXJVaiC0XnUo9Shi4Qr9bmfk8V/NtHZfTg5VZGYd
	0NnMVtJqj70OpIcsUdfqsItRUypWuQjkleB4mtKSoVBs4ylTY9KfJV63vAX1eKz9SmDsk/K9OlZ
	9R0DRctx833Z38fv24xYl7gXe1nM=
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id 5614622812f47-4c012f36474mr6689093b6e.4.1789052823994;
        Thu, 10 Sep 2026 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:6809:24d:10b0:4c0:12f3:6007 with SMTP id 5614622812f47-4c012f36474mr6689016b6e.4.1789052823389;
        Thu, 10 Sep 2026 08:07:03 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b97167bd69sm19340773b6e.13.2026.09.10.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:07:02 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: qcom,sm8550-pas: make qcom,hawi-cdsp-pas standalone
Date: Thu, 10 Sep 2026 20:36:37 +0530
Message-ID: <20260910150638.3270162-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
References: <20260910150638.3270162-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX/paiHjTkc8V6
 H6wfEagVGivv0AZe/t952VzeSaWQEwnzraU8PwZkhsC4ae8Jalm1qMaVezVekLMiHQy9PVweUeB
 VPf5c7Ihclh3yJ/n15vNq49P9SgAsu3J2X/pX+pmRE4w7DTqi1x7pBM3ldleEryBTEosepCA7Z8
 PkDGU5SiuubHEAbFlL3LvhbbdmEEZuLYrqDF7noFCavd8ZImNDRanHsFWn4DSKBsBqMyRdzQUfA
 MkUenaWH/y+sE2eXJqQusoK7R2i/yUEN1tAUYMOJu26Ijwz7ojYpRUMMxIQLGTAy2JD8ym2xm97
 vPHlX2uQO83RIjdWyMmT5fvx1jVt/q3kEt2ch6ruaGLycmLJ6UjE0wcV+t+G25Lb5XiTzGL8nh5
 i/FRGPmERUp2K5RKdbViaZ6FradxQimtm5J0dVtqSe4ALPrCBP/lHw3my1BlPPem+GE2RiXGfe+
 BXr6c5+I/vVh/Pe/C3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX6VMnoiiN/+n4
 xQrpvo/aEPO9lm1Dz0MEDWVwWCpFQjrJQg+K7gMVLRA4EyetWu35hhsJLhjXti3U8fspa9D/MXp
 QeDvOjMDRnH/M37KOiVcGh84wWUb4ts=
X-Proofpoint-GUID: 0JCnIbCizkRP8M7HzXP8jHnA-oPTpbZt
X-Authority-Analysis: v=2.4 cv=TupzFzXh c=1 sm=1 tr=0 ts=6aa2c798 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nzVwBEjDhxPf8YtRev8A:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 0JCnIbCizkRP8M7HzXP8jHnA-oPTpbZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

qcom,hawi-cdsp-pas was initially grouped as a fallback to
qcom,sm8550-cdsp-pas on the assumption of hardware-level compatibility.
Bringup revealed that the NSP proxy power domain on Hawi requires a
specific RPMH performance level that the sm8550 driver data does not
provide, breaking the compatibility contract the fallback string implies.
Maili CDSP shares the same NSP power domain topology as Hawi and must
fall back to qcom,hawi-cdsp-pas rather than qcom,sm8550-cdsp-pas to
inherit the correct cx/mxc/nsp power-domain constraint.

Remove qcom,hawi-cdsp-pas from the sm8550-cdsp-pas fallback items block,
add it to the standalone compatible enum, and extend the existing
cx/mxc/nsp power-domain constraint to cover it explicitly. Move
qcom,maili-cdsp-pas from the sm8550-cdsp-pas fallback to a new
hawi-cdsp-pas fallback items block; it is covered by the hawi
cx/mxc/nsp constraint implicitly via the contains check.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml   | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index f722c55aadf4..99e9aeeb4f62 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -18,6 +18,7 @@ properties:
     oneOf:
       - enum:
           - qcom,eliza-cdsp-pas
+          - qcom,hawi-cdsp-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
           - qcom,sm8550-mpss-pas
@@ -27,6 +28,10 @@ properties:
           - qcom,sm8750-mpss-pas
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
+      - items:
+          - enum:
+              - qcom,maili-cdsp-pas
+          - const: qcom,hawi-cdsp-pas
       - items:
           - enum:
               - qcom,eliza-adsp-pas
@@ -39,9 +44,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cdsp-pas
-              - qcom,hawi-cdsp-pas
               - qcom,kaanapali-cdsp-pas
-              - qcom,maili-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -278,6 +281,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,hawi-cdsp-pas
               - qcom,sm8550-cdsp-pas
               - qcom,sm8650-cdsp-pas
               - qcom,x1e80100-cdsp-pas
-- 
2.55.0

