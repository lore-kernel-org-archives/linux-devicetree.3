Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25896339377
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716324; cv=none; b=swHIFS/HtHy0SbeNd4VeJeUzG9BD9k7c0CrwSnW0wPjTLYaIvZXRCLmfTOxptVYmqPrjLsVLWnx4oDXYkR0fcZCcD48bDWCU7jXL1uKMz+CqVA972ZC4D/VLJ9/38SoaL/n2aSTK6p6A3OfTJo3B8OGnF04cQlrx22Z7yWO0ttA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716324; c=relaxed/simple;
	bh=MvvpDV9Y6A38BbJrva9Z8EzWUi4fnWaUEGEJuCRfAeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=G+Cw4N1QUNuhbLoWf57hd5Ur6QBAbNXzE7gas/afQBsxjIy3el3aVRfK+y41F9u0g2F+AhPjSRoM6PwcYeWO+S/j/xgn89cGmifIVLE51ex4Eurg01rYcPWeoIPF3QK9qQD/xScSg8dXXaYI6N6LozUZBP4NctsVL3tOK9qNl+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ey0FBdcJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aIj3QqT1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ey0FBdcJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aIj3QqT1"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x2tn523926
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hZf90k7XF9sKSnq+U3mbap
	X0xPnIxa5yOmPxj9jAkcI=; b=ey0FBdcJcJl+VCb6+qgE2egU/5VQZTjij5ww1X
	najZp+DVPzLFlPSc9dGloD10D5tKhqnuUxMo0qRfSLtZEuE+ZRWn/WLvIqCzoyLi
	hRpZtjCeWM+rpMc8Ka8hp8AIdE5deKHhUMYz3o6VeNTQDPAIuyShaICjx6V4A8F/
	ObbnZ/DxO4MoWac/PXXu8Q8/+MqpRqjUf+wZ9hdE3PSft+T3qVnjNCrQMGpOuScp
	qR+4dd+80NgKKfYtkNnFMnqpjSM9/c/7xKE8hWb5WWekbYY/nLNCW/9PlQKUWMLS
	xypZ3YsjFRum+oQkVyakf9lDqCfziEeuk+ay1z2dh7v+A51Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjrtt0xus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:32:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so1512845a91.1
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784716321; x=1785321121; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hZf90k7XF9sKSnq+U3mbapX0xPnIxa5yOmPxj9jAkcI=;
        b=aIj3QqT1mAL3uyaBbGE6NBB5lT8HyQkA0NiJb57oNxkZPWYLNW54oFwWMDQIyqMmul
         coVbea87M/N6jYkK6zy1j2NY9lcKDIP5OmBqJ/AKbgwSq0ClbV7F50J8c2GIXwjubNB6
         37RhNLbzY+midDFRA1mFm3DAA30DDKhwXhxtS8fJDBPUZ7XpjUQGELuYnKzV5jn/hHy/
         KmUT7JxbWleHs9c7PHxWm9m4w5oltvMhwzPNRQ8vvENSqLQ1MDnCG3KEbhqEFWIYysD3
         W4PEydcxur987HjOLYEMAnUQVXCp86zHCaold2oF2sHV/TdI+r4kGTHTXZ/RgDZspG0Y
         B4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716321; x=1785321121;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hZf90k7XF9sKSnq+U3mbapX0xPnIxa5yOmPxj9jAkcI=;
        b=WaHeGPti+IZrLq0g6dXeubkJQ7/HJkmcII/E9sKILyOpj9bPjtV/rnE33Gf/IYGBxO
         3Zu1SgIZnJ9nM9cloDoy/bwj6Ab/b2AM0s51y5PP8Cnkk4s5ZfNY90T8EoVV5YpPxZpm
         UdyNOPkdJYfmvYrs0lbgd30C3xXWnHlm9ul5+uyeRv1OWRPywVYRuIs/0XS3wFKl6ZwY
         zqCwLxnUerjVS3G4zi5PrYdypYQxTpF4LLUl3e9rtgjwRfgkFNw6A8pLYr0Y1A5cFuyP
         +xovyOqCGVI/Av4Z5x6qOKQx9Tf9kNFqXHAIZwMrShUUdMNxjgcVyINoDXs+oEUT2pru
         vWxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3krkQHXCwXAxDl2D9CoesLAy1QXqLnb2Q7soAhKi7Jd5fR5gMPl9Q3zDteTL8dnZsIDT8yLo9Hh/7@vger.kernel.org
X-Gm-Message-State: AOJu0YxgIvFD7xUnGlR/rHUZlRPrni0pQcJV49pnUmwkA6XNYRB8Pdn3
	AaZecJy7NIJpk26rhxOPdGICSXlKxHS5mQrmwEXSMI2HNUrD93deInBP30Mvc4b4Yl83ERd6nqy
	R/u+v1Hrj7WJx0RkOaspC44YD9/5TrK1rr/zdEk3pnAx9uFnIGw813obKxDQRdB4=
X-Gm-Gg: AR+sD12IgnZ40HHiibjy+GtPRfkeV5objRO3zwpQSTPn6xMBRYAzj2aLIdOiZd4M6mm
	hydhqj9usTW+gtlvPH+KOGHb1bL0SMx520nDVgHt+K9sdspJq9ghMWXKpnlIny7DUfmLuyv7agE
	lj9gieQjZ3FJLExhfOMRBmZZwZESn+YSSt+p8NhaelJxumiIRV+HdruFRsKMLK5XyjIFsPWdhsT
	tP0IlgI4fVolDS5jIr5RRPYIn1Vr3KAZJrlU3xsPWlUU8fQpWojFTA3+toAlTKn3dtfjo9vKZBX
	/wo8/Xy57l1davtMmkkV6E/TuDmN91k1EhK2QrY8XCqxBQppeH7hYLDb+ExJj6EYR8SxnFhhf5V
	W5h2w5gs75gVG9oNGyMR9RNoUlaLecw==
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr22387167a91.18.1784716321561;
        Wed, 22 Jul 2026 03:32:01 -0700 (PDT)
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr22387136a91.18.1784716321176;
        Wed, 22 Jul 2026 03:32:01 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9399714fsm2814483a91.12.2026.07.22.03.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:32:00 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 16:01:55 +0530
Subject: [PATCH] arm64: dts: qcom: Update spmi-pmic-arb interrupt trigger
 for shikra
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-fix_shikra_spmi_interrupt_trigger_type-v1-1-1f8a13528cd7@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABqcYGoC/yXN0QrCMAyF4VcZubbQFVT0VURKtmVdFGtJsqGMv
 btVL7+L858VlIRJ4dysILSw8jNXtLsG+glzIsdDNQQfDv4Yghv5FXXiu2DU8uDI2UhkLhZNOCW
 SaO9Cru0QB9yPJ/IINVaE6vJ3dLn+rXN3o96+ddi2D8AYkcaKAAAA
X-Change-ID: 20260722-fix_shikra_spmi_interrupt_trigger_type-1baada5f9e0a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784716317; l=1115;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=MvvpDV9Y6A38BbJrva9Z8EzWUi4fnWaUEGEJuCRfAeA=;
 b=RRUkG9OTZGj6k9ET0NXYrIAPC72Xz9KTsQ+UiO0xoy96bwWleySwg4KOkY5EOZrmPwYA5pGKL
 uCXsGBNA7IKCn4mcc5SP7PZDs/DBmse5t2+kK49Fqv0tacJVq6Nrv/C
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-ORIG-GUID: Id-j0l24Y3VTLUmYYhRGEToSDd_q7sFs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEwMSBTYWx0ZWRfX0cjCTa3bNBmM
 bBH1I8iNUG6F12ZMrQixawKZ7erYTxR5cto6i2I1q2dpnJ9UI9Z4RV59cJ0ZVF2zgyXQ+9tPa9D
 TX5QCnaGZXnVv8ANpgxGxd2VrOWcCA2jhyG2nFR7UCg/3cXL1NZhHvEvk33iHKUryjA4V52QRrn
 JaoMCJX0aLD0ox3dOiFpbh07DKhnwouIuinmS3s1OVJFtl7ridpwo+J+vQWDKcbydvm7YOnOh04
 EWok04RVAnbBbFVpl8ws1k49c3RwDzHVJIAECn+5uGNneDRIMDsHf8iSoiDz6LRS5EAkDaSvsoB
 0icxeQXIJEi1bam3p0utE+JXtXf7n0z68895mD337PujbX1qeCs6AZYdlzetji3BRdrWs/YkTT0
 8iOEgq693vy6SqMGF2pTtvCUfxU/od2qgzF+s5jTrv4LFWvcxFUsMkYKr7n3Pu5BCUYQwU/zbG4
 RlkdweevBPb/cttOGCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEwMSBTYWx0ZWRfXySrebGuiRu/+
 /H1k+/aTr4Zi5zwPQpIU7IMJHmsC6iflFBpJhgBHEs9kwgAESwxRJaOfK7Q4td7+iFN+nz5U9ra
 X/oSDdV4p0ip5sPdZAzLHweBlxC6uwk=
X-Proofpoint-GUID: Id-j0l24Y3VTLUmYYhRGEToSDd_q7sFs
X-Authority-Analysis: v=2.4 cv=V8lNF+ni c=1 sm=1 tr=0 ts=6a609c22 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=5lLYUMFAHtOtsrg8WBoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220101

SPMI interrupts are not working after suspend/resume on Shikra.
Update the spmi-pmic-arb top-level interrupt trigger type from
IRQ_TYPE_EDGE_RISING to IRQ_TYPE_LEVEL_HIGH, as recommended by
the hardware design team.

Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 4e5bc9e17c8e..80e8045282d8 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -511,7 +511,7 @@ spmi_bus: spmi@1c40000 {
 				    "obsrvr",
 				    "intr",
 				    "cnfg";
-			interrupts-extended = <&mpm 86 IRQ_TYPE_EDGE_RISING>;
+			interrupts-extended = <&mpm 86 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "periph_irq";
 			interrupt-controller;
 			#interrupt-cells = <4>;

---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260722-fix_shikra_spmi_interrupt_trigger_type-1baada5f9e0a

Best regards,
--  
Rakesh Kota <rakesh.kota@oss.qualcomm.com>

