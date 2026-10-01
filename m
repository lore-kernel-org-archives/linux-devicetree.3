Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C801952BE47
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867494; cv=none; b=XbQwVJ5XRLAMzvSHL/XE/lKqG1yV4APhbdzH4vz0imgrOg5FmSNwxUqI2Qw4BLoY+Z4endqoi80ee1l+ek7mrkwg+IiVKM9cfzBSzkB9B8QxTmbPSnECB+RWmf41xUYldFgFasM/qoGTUMRgqHNt0p1cf/vwycI04d3VmPVyaFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867494; c=relaxed/simple;
	bh=vSBe8LceVVKpPMYgu4L3tld4R2oYmbP4ywIrrausTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqVUEmuAhSpuMWy0gumsGftcpzzT+DezcXIeOCvnElGd/TGbob08IvE418FL+V3apzKAY4KsaBX0Fz/xRro5Y1vLpHTrpKkVIfKL6Yr/nI0jUA8byCukTmypPfcKusPxtG31A64qs0tszT9BztMRji84aheaJIZlM8VWbXNi+Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aAYDpwxb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UDfIKtyy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aAYDpwxb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UDfIKtyy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691Didwk3776293
	for <devicetree@vger.kernel.org>; Thu, 1 Oct 2026 15:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=; b=aAYDpwxbm12RBMyN
	PGp6usachhNQava4MNLnJcr3KYoEo9HcN703zCxZ0EM7goiT8wv9uGxVG9wz/jVS
	aIm/E3nlYMsFzjRo7jbO9E/NKRJCFN7qDOFqnvWy8IJOFJelYPutuodza7U9NgP1
	bM9x/plsNOGpTx+Kmfugsv3rkMqh6lt1eyEIDy8KXWop8sveNXj6F4K+9LZTcLjB
	vmWXvG4l01K3hhDqO6ylwlSpDSSRWCXUG+AdMwERClAvlkVIRoPv1LUtK5fDtWds
	o2swiNxdHC3iS9ufsmck5qgjL283YEgbviLYcEdktBqY6yXOmt+EXHoNRNECLT5T
	Jx0pQA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b9359-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 15:11:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1416f32fe11so7190530c88.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790867491; x=1791472291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=;
        b=UDfIKtyyB0BeT1eCW1y0GRdhaQaTU6cIQ6tE9KxvuSUE/pzvMSXd7hjaMgIr84eE+D
         zM7dNGvdgNEVoAbvD4KM4iw/0ErnthNdmkYC0JbfrpBb09hZgip2cqvwuDBJKJIxnTcQ
         FdijJi0hYMQGwP//9u+YVEhN0fWtqk1F11qlkGKlYpk3cmCR3cV+6s6ejvok2IKAKwjh
         3tmANOgxtesIQhAZ4YRK7p+0JRzagirovNVYyLcLujw+v634fA7R9+MC6WUL+enB0lDC
         cqACuYF6swdI0hXNgv/sAGBRaRGZl/3MW449KOwyX1qvHGbdqQeltpMXbZAm18kTCSaF
         aB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867491; x=1791472291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbuz+zk9zbA79AuGD2ZwTeZtX2jmI1UqeTVi/rLlvlM=;
        b=w7b60SwvIQ1NYi1SYUxC//N3FeCr5EE5fSUctePlXCS8L6BppdSXBbZvXg1KcJIK+B
         jcuXsSwGHCr/Nvu2alQk2QuGu98xVKhizSyFCAQQOt+r262KrhI5NxAjXYJbcoVG89Ps
         Y89X1PNw2H0NNGItVZeBAVMG6m9jkwS/fkCxBdK4R/mZfXlr/SftfvPKOYDK3nM+y6DC
         7nz5HZa45T5Wf2yVTYCJ4XhUAZdLZ1iyMVRVoEce9+ghzhCcyEf50H2UJvGZpkyE1vpN
         RfzX4huPJvArnvYpLW2vJMeU/g299Sfz5oAL4Gv08uldqcrLf2pyYGkiD5y5AuRxiueE
         0vgA==
X-Gm-Message-State: AFuF++kM+XjwxNieJy1pC/+doK9hCKZW18kIGfKgCEsSzGfOMjwz4Yj2
	95aPBK33zBaJ5+Nz0Odiul913Yo7q+hQw3UztrNayo66wAkGsRsddLQo4FAyORWGywlfx/qQ87c
	BTi2h5lYZW/vLb+hhVwUxwGz20vCGu3gckSIZotitB3Yerfwc15LEPK96f4DG+zSc
X-Gm-Gg: AYBFou1JCWS868MNG9JNGRuU6rH9IhX7dscrpNb5vlz7z1JkKacDi9sJodFC+Bma6rE
	o6Hb8oZnSCPowZnbJ0H+kdXVTXimcPK5cB9RdMEfZB21mCT7x9gGNYb3e8tJZWP6IcWZ41XLUzg
	PbbXcUdibHeHMpBCDqKB0QpO9hyLOm1ZoZyxcwQH7FLM+QYhnRKhmRDPKatj4M44T2nnKkaNFTq
	3qU269KNS8a3g0DaKkoeozLQ1UPPZl1BWIKlcbHY7E8i5q+4MC+znoAHRblvAIzyqS3bjgcD9rZ
	bqlFq/1EfKGHcynmSXthb5v3n/SYL3+0AGoggYhI55gf8ZKMVNlJElJLUMLvqxQ/BFMAhO58B+2
	t7Y6dYWUsUldhriIBpBRk72/DtYD0Kr7jifOYsK3MMNpblZDYDzRyQYP2G3l27zApI2468PB7ji
	pdP07/Jch56l8K91rB5h4xfrzrGAO2/2uG0w==
X-Received: by 2002:a05:701b:21c5:b0:14e:d8ff:1592 with SMTP id a92af1059eb24-14ed8ff1604mr917853c88.5.1790867491027;
        Thu, 01 Oct 2026 08:11:31 -0700 (PDT)
X-Received: by 2002:a05:701b:21c5:b0:14e:d8ff:1592 with SMTP id a92af1059eb24-14ed8ff1604mr917808c88.5.1790867490348;
        Thu, 01 Oct 2026 08:11:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f265d307fsm56159c88.3.2026.10.01.08.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:11:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 20:41:11 +0530
Subject: [PATCH 1/5] dt-bindings: sram: Document IMEM found in Qualcomm's
 IPQ9574 and IPQ5332
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-imem_restart_reason-v1-1-79f516906010@oss.qualcomm.com>
References: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
In-Reply-To: <20261001-imem_restart_reason-v1-0-79f516906010@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: W96xpr947gyT0WB0GKGjaYllCuzdENEs
X-Proofpoint-ORIG-GUID: W96xpr947gyT0WB0GKGjaYllCuzdENEs
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe7823 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX9HIdBlEKZEyQ
 czU0hZ5C4pQgW+cp+DzUzrMsny8MuKCc0bYupYi8nv0FMdDDMixu9SdYAjhH6kbTYL4pV01GLJR
 O2LX4WwwOfhsPMsNegde7DVwHsMsZkw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA2MCBTYWx0ZWRfX6VG2dN7/neCk
 flklkLFRaWW3uO3AtP6gGh0CSB5oP3tqIpoZkHhUhV9lTDXB+w/ka3aF4FOmENnCF6biyqLb7Vv
 ynfC/zkM1MAoW38NrluFAtwPN3XbR/IYhpVIjaSgdFI6r41d0GQeNol1WRiY3Ou1XoCdrJAfSv7
 lVs7R3EI7bUQ8sEhLyU3pkbJERvipqvZrdJ2RBW8Dj+rIoHP+jGEbnRWCn8+s+4NZhtGeoJWxjI
 OYWv4pg5f1xXXXMj4pSpgWxtoz5uu9Xsxs1tryF+XZuTUwOQ/B9TyT2d2h9mLbbp2XLxoBH21Vd
 lA9hnyGVxQM1M1uAfUCpT6jaI2Lr/tExma7uqF7Tx0x57gwreI+ASWO712Pd0pRISwYakgdR+YO
 LiyOlhdOFhgGUnAcX9YPd2sgffx/FjMWnqb+DGQ55qbTQn6dALPjNeOFCu36OtyiVixawCgYbeU
 S6nEAo3rsxnfWe1QHYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010060

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..d65696885e6a 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,6 +37,8 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq9574-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem

-- 
2.34.1

