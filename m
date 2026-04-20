Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A767713D539
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776679472; cv=none; b=uwOTK93Ggr5DuQVBpbi7krzlrRF1qmfzsu0eloK+4jUOoEw7V8ye3+rXan4gyErW2eQAXjYf1/d79eagwQoyO7XjSoedCwJaHJnqhzqgXXsGjnKG47m3N7m+I+hXzjMIdR9YUuWBvO4o4SlgxqlhDjs42wiOd0mTtCvbH4yhZds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776679472; c=relaxed/simple;
	bh=eV9AES1TbhXq51pA2mMeaDXNGOeNegLY90c01VW5r+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pjwaMnGVRb3NmKQGfX0Zd8twKhuRTjY4wLCgpJ+hobZaNJhsa2Qx63CiZ5keGuleNXwdAExvQfUXgLx0js/zHzanGVF69tKazH42gGQCsR7m5x63zqrMU+s1UQH8VQPMGGeDzhXMuVAvjpA9pKY7zgibdou0LeHvsrR+ua1GsOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kniTWOR/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CAsc0SDj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kniTWOR/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CAsc0SDj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63K9J3Su785485
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=EHoyER7aYaxX3ZQ0duDO1RAvEw3sWVcW2tA
	TNTZNCgo=; b=kniTWOR/XREAZ+XnphXnrZ08z88NKFVhIEXCFD78IigEnTF/nS1
	6TuLtUW6juW4DFoVPBu7OsBa5C9RWqhO2W/MZm7sePFGayFbvETPj/eeN9/Gb83U
	CKbbTo6AieOyMQAHsDzrayohfPlgL5I6pQnpjb+TzvU84dBOshdOIhB0AgvNcJCA
	k/faOKNDCdU5x3Swgi4hlOvP4POSSas+r/ImfHEt3zSCliaVJcbhTvAB61NmqFiS
	bYuTqFSo5wu2hEniXl3dVy37qtGwuho+ceI26ZR/xGsL0095tOXu+Q2mOlXJipIL
	XjMBoslbKJlYqGQw12pBzqsIEEZ7VbM/e+A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnhdhg5tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 10:04:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2dd1c74508cso5324828eec.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776679470; x=1777284270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EHoyER7aYaxX3ZQ0duDO1RAvEw3sWVcW2tATNTZNCgo=;
        b=CAsc0SDjzgb7NsYgZSqAw89njsNOWBTA0Mk76tKyxvq9aFMGWZLPrng9+M03UvQifC
         0b/B9XLrq1rx534m9CP8awRlZv08zwSpygRfxkkmiie8UuawwZubE/WWcAoWmseqp0OE
         Y5sdtnajfHCH1wat6uA5s0w511Bio01e73az6rb6LfiQnvkSCoKIfX+Uw/gcMo92vkwu
         ycpvDbv65bAL/qoRHcYdpFbgYHKNzWEgRhtViyRtxYMKkI5FeTZ2A5NGGlXumPCQON7M
         Mm9zZtc8hvBpnjFRREl8fj/EwzhWhDso8/7OqIOLAfGZxuzuJyJd/I83C8HiKQcrCCUS
         dMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776679470; x=1777284270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EHoyER7aYaxX3ZQ0duDO1RAvEw3sWVcW2tATNTZNCgo=;
        b=G1U/ETc960aV7F5q8JpeDg8kPsVEwmbEeF09/CIp3FNlyCsPZEu0NmWiKPzbAHI9Os
         GiGUpHnlcUWxQRuSyeBlcMpycBdpqn9rdMguJlS0zQDManKnYBPnR+dk771MlnWU+WQS
         j4oa/psYhdW/BL/IXonQI1Le+1K2ZCwXJPjOFXye2doNXgv/nMKbVw7IZI16st+wUv0C
         SGNOC1eLmhHUENINVqZoIZc06Y49fgxz9foVN3fwVeUe9hgGP1le4RXmCj/7eDPKozI7
         S+B6TY2Cw9XfT5+7WqEhO2OVJ7c+hTT783IOTDpRNKOVomVCRmmyRlKOpiriqqH8ka0+
         JWVg==
X-Forwarded-Encrypted: i=1; AFNElJ9uZEO9YBxbmBtHGO3DqVzsFrT6O8My1EW/8q7tgO7iWTtecOMm9Q6o2wTApSCol36SRrZ09vdrQktu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy/nv6VLwaBwKnoCIu9nw1jefhwF77r2JhW8LqfV4IN6xJg3Xt
	p2Q6sZTjLJuVHAaQaCbAltEBZPRN1ZcTNoAmH8D6EAy4HBZzG/lniXu9eg+oOa34wQ30Q7wszkL
	aFBbIVQBqq5yizCWiMt3Wrxaz00Ls4fa9RRk+TZ7BIFZzr+EY1BezoJ2ZRKdGN96m
X-Gm-Gg: AeBDiesUnjKXuQOkZKzOFMlV0g7164LU4JPiGe92jXQvzBP2E95CokoMxuwSn0BVBlf
	3/F//TjBw+o/31FzEa1J0/nkIw6ysc/605weq1Unix7hphKaUU9rqWlvbk7NbfYBNe2DPuFXFAE
	X4Cn7gHaLjICKSdWfevAhI2FkT0CKeFUTQYAMrbXk/yyF/LmMFP3QdppohKd8K81298LEF7hrR2
	jzLa37i+r1srTObVVinFctTpSk9BTXJCKoq6k1sxH4LO9pAjcvWNAIh1iPaahXWEa5+9oWP3Ppv
	kISY0G6L0wz/bCMnOyZg33IZqQrHa+EZuIyi6FHpopLponC+OiWe2nx0iGPJMoe22dior1kUQZV
	YJ8CR3oOhxsgj44Evk2uSBpBsXMbpQ2BATT17RM2b8OSzz4T5jJ1doTJhEaSuaG6RKZvL5jJ/hQ
	rOqR6CLtIzEFccgstQ
X-Received: by 2002:a05:7301:1f06:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-2e464dacd7cmr6486564eec.8.1776679470199;
        Mon, 20 Apr 2026 03:04:30 -0700 (PDT)
X-Received: by 2002:a05:7301:1f06:b0:2dd:6937:79d5 with SMTP id 5a478bee46e88-2e464dacd7cmr6486536eec.8.1776679469653;
        Mon, 20 Apr 2026 03:04:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2cfef3sm13076436eec.24.2026.04.20.03.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 03:04:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: "Martin K . Petersen" <martin.petersen@oracle.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Kumar Dwivedi <ram.dwivedi@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 0/2] scsi: ufs: dt-bindings: Add compatibles for Nord UFS controller
Date: Mon, 20 Apr 2026 18:04:14 +0800
Message-ID: <20260420100416.1252983-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TtKi7wQTpMfROc-D1Ws319qSpy7pv4ou
X-Authority-Analysis: v=2.4 cv=IMgyzAvG c=1 sm=1 tr=0 ts=69e5fa2e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=a7bZ31jgoYMsa_LFyGoA:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: TtKi7wQTpMfROc-D1Ws319qSpy7pv4ou
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDA5NyBTYWx0ZWRfXxsU9WTvZnOQB
 3238aSHP68NkJeZI+eJ1oPoy8W4ATTXSgjzkwsRBHuStwswRUN+4JpsRV/bhg0GRxeHaQk9qRyL
 gSpP7P9UBhIg5wqShklXuY9r/a+Y3k2gYrRADkL3263jSjknsipQTJ081t+pgwEN9Bh7Q1YWUmk
 1TPdOCNsSxHl2cPo6KKMnd4kwz0B3w7QHGzzhxOH6f4f2byM59z9Tq1eNeDDZvikFw4DXaOfAQ+
 HfMoqYhgjAvaz5/ST1T8xHzU1BjkUot5HjDU9f7PkdiqgxEXFNYQ7/8F6GAOWCRgKoxOhzjlces
 N/eX/N0NIDBUlAO9OIRIXxYuGjh1GB9aP35QqcEGrl98ywSZWHXZmPgfoJd/qdhXTHRpL4YqcY/
 H53Hfk51LQlooaWddzcKtpRgoNuOScjcAI3hs09Y47W/7HwEjMdvK+bYtDMHGvwaqlDXN7YAup5
 vrI8SURe0YiRlxif2pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_02,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200097

This series documents the UFS host controller on Qualcomm Nord SoC.

Nord is a Qualcomm SoC series. Its UFS controller has a multi-queue
command (MCQ) register range in addition to the standard one,
both of which are required.

Nord also has an automotive variant, SA8797P, where the platform
firmware implements an SCMI server and manages UFS resources such as
the PHY, clocks, regulators and resets. As a result, SA8797P shares
the minimal OS-visible DT interface of SA8255P and uses it as the
fallback compatible.

Deepti Jaggi (1):
  scsi: ufs: dt-bindings: Add compatible for SA8797P UFS Host Controller

Shawn Guo (1):
  scsi: ufs: dt-bindings: Add compatible for Nord UFS Host Controller

 .../devicetree/bindings/ufs/qcom,sa8255p-ufshc.yaml        | 7 +++++--
 .../devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml         | 3 +++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.43.0

