Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795517595;
	b=BXzG/OHIIbj0s0EGDWnU9qm9ZLkj1s1B6aM2Hdw+ZbJnAqZnSxw5Vxerg+g4onDfE7aT
	 W8rFx49IuyaTEX3tpGGONnkicDHZXzvXxCOCB5P3J1xN3jzYDo63PkkkMzTWIokCBx1zC
	 nP+NAK/bpAPtf6YLjkDegG4kx8Mj28IbRnGICPuFLvXFeKhJYd1EZHeDTtZNouTEPiPhV
	 rLqxRRhVwU6yKP2nUbsT9UgLBgH8CrO5Z++g//SscUl04Nk2/m4rkbOib5idUfnXnJU8e
	 llPbbn+9l3tj+tHwJCEI/sDZIuk7kCXAJmFCArA1J63aqq2V3+0F/ljieZWqv+lDKDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795517595;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
	b=nduayq9twMD3aPai6YeiggVzb7AFcIP4gqqvGuJCsH4cpVu2QvfwpXZ8DQNE4J0vyHNa
	 l1srmIYNegRDl9ULwou/twv1V4a82/Oas5xhqILI7QNuCmiYi8cEEtZbVoz19gA9fDjjN
	 ygz2ysf4E0jz1ZDTJS7Y/hhnP/yF2voqXF/Auo0LculUtt9AbsbAE09k61Wwg7ZqcGzyd
	 xlnVPNIV9gJ2inlyl1nyfPwDe/8QGeu+ZdyiayKaCfn+tLzIIoSbBVlldK7+RhnQ5G6fa
	 7oa+BZatJBQbfy6p/o5micYlWHVTuIGTmQdX0YnChwnRczF4u58qSJQSwurftiokmlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220B4606A32A
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 220B4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZcdjbbCF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D4CDLqNc
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO8G5vX196999
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8
	Nb2PLcPQ=; b=ZcdjbbCFeBkHeEdI4eqLkIstKBiJ7lJtG5BkB/ox7z1NZurQrYQ
	Oh38tErfA9R5OebUUn+a1ZCve0EGK5tSMLpKYKc84UzjjZ424oUQ9Z6CSwnDc3Hq
	xSkoBdaSa4H+Gq0opVvTTAs2V1tha7CUIkfSUO9G4G8hq/5KqRg2LKODwJAI/OjJ
	X3B/whVU3ct0X+/eYCoAaHvb+iyvn2lB7k1VGJ+W4o26u6S8etmeLr27/iGS7wUZ
	owrih+TJuKGdnihPc/OXb8VSUPhJGth8e56wvyRT0tvKz+dk2HSzogznv+NcyOpW
	fqGOAHZkqCxEgS7C6L3g0XjIzvQN+GUKlEw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukrb9nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 10:53:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2807599c88.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795517593; x=1796122393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=D4CDLqNcrlRgIfEsJKBpsgKqGbcP1hFHAzw8oJSVG4n4EpkUo/VUsJqjTLyJrAHEZB
         RMpRloGUE4caD+E4ynbe9/Bu+Vfx1FChoTORpiEL6iGMaFG+B/mTO0Oy+LRsWgXJmOWl
         jI0YSlYEYafrcAmv4t7hbLGa0qWyRGsgFB1gjWRIODyewj/I02gBzc5p0t3z5JQC4s/9
         BQLXHfAmuKoiJ6Uv3pBb3i0HAzhz+tAje4c4Po0FKPg/MORFijiLfrhoDXDFpZ+E/MJF
         pBgfApEdwP/OoaeZcLYyLQck9/g3NQvh7MiitqQpGRYoISU2oLE5Q26UhSyZq2Ah1mP1
         s2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795517593; x=1796122393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ap4DOcLXbm1ZCm5Pn5mEyh70hb4RUeeOFH8Nb2PLcPQ=;
        b=bbc/ZBsTgxTB1IDEgHayi2OnY/1gKNsqPnoImye0kfGTt6ubYiRV6DoCFUqCBa0hU4
         yZL9y6AVGDcboO5splXsfiuiUOoiJw14pNBlsuxterqLlXIjQQNJEWjvyRGXi6BWV/hH
         vgNCFvyUp2rWRUXWX698ufSaccUGb+uw8qVRmrEZxhztAcbtSqGpECOnsXqDES0+pLkm
         S/7EjD539Ta6pwzt1oJxzzlFzLe5o5SVkROBiMX6RFOqK/m372nuk5SiFAJR1lifZtpp
         o3MKggZO22418Wu1IE9/k+MgdxNSYIk0VwYM8jmUvw83XPpdwarj7FL4pxB9A6dgXi+8
         sfZQ==
X-Forwarded-Encrypted: i=1; AL+hErEG5w4xeMuGXmSQCaxoNskIF3eAfz9bni4PF6JyT3gmlKIJEyNRDbqvQhO/aHuVAgMo8tC2dfFUn42x@vger.kernel.org
X-Gm-Message-State: APuU4Z/tVl8vMF1A+/Ny1YqGDPx8VTEyVVwvbvWduVBQHEAyEOOLe9pH
	TQPUMuSu/w5fhtkLZ8iUHuqh0nDSLrEetnK2L8f6MmgqerzCvNRdtpChZ8pa9AO7JzxmZ8F+OJ1
	9M0499/J1k2QHEbHx4HWmP/vw/xH937IA4iNJsha1S9bSV8hb+U+nS0ogwM3b55n2
X-Gm-Gg: AZFdTZfEBDZTs4C8Rb8WYEFRH27G/C5KUc21oriYTFy4Jl/RQ/BM6oVTkPx30S0IOQ6
	1Ziq66qZA2YFE9vvP8aCEnJlyHJ7+ykboEzvYhTgYDiK049djQICGwtsNfHBcr4yF83abcBJhNw
	s3bJjXaOyP57t7VEfHkOckd7/cMhZm/7ENcArtMrKwqKR0M2fqIL8OaDPyDmXFL9w8cM9xIWoZb
	yLgekNXupUfwiRVfB/gCFg/1xeXbYZ7YgdtxrrdhqjjBPjUpsLZG5U5dSoGajDMlCcpAeAQe23i
	F+LZZ8QLi5btBgEMnNM7zAy/fZjIjgTMsM8zI6gxaQ6QR6mZ860VrYnF8kmBSWgHpWh5AA2cS4v
	f+dm6zb6f9cVk9w/KCTjzOcOTmhXM7quoEA1ijd+TASWXejNpbyAU9nENFGQLIOnWTBJt6Jawa/
	EI2rZxEWZ9bZ0LYsQ/iLN8RsePs4DGqY5U45gsSVUka8M3qB6aZX0ESgfJ
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232609c88.20.1795517592571;
        Tue, 24 Nov 2026 02:53:12 -0800 (PST)
X-Received: by 2002:a05:7022:b058:10b0:1b5:330f:6209 with SMTP id a92af1059eb24-1b5568a32damr14232592c88.20.1795517591912;
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
Received: from hu-ymg-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm35075998c88.12.2026.11.24.02.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 02:53:11 -0800 (PST)
From: Yadu M G <yadu.mg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: qcom: Add Seca TLMM support
Date: Tue, 24 Nov 2026 16:23:01 +0530
Message-ID: <cover.1795517583.git.yadu.mg@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX3CoJ+8p6/mrl
 7AFuQxCcBDz0qDQnIF/zgxVNgpIEjL8lmn+VE3/86+zS4oJvrTnFold5yQy+/AbnjXyZPLORcom
 EkSC/P+jLGL5UPLL8BRgpM8HrshYhSg=
X-Proofpoint-ORIG-GUID: OCV6Er27hjooMBAikA4AWMxRngqOxkDE
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b056c99 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=lHObh2IfMKzVuqTG74EA:9
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA0MiBTYWx0ZWRfX8/OeNtPA3va7
 uwsupYQwOxV5KA/4ddJqV2i1WwQZog4FONOvp4vc1NvuMG0ShJxs4xdrs9UsVNbUDbY6Ft49NMD
 Jn4s/7hAFmMz5W1LNTSMKyjVgVJCzKtlRVE+o94Ik/qFYvesm8nkLM07Al/oD0vHE0qeVuwomGP
 DfjDVXldSgH0WSlm0yJR5Qe1EADmH9zJZ6KZgnZ3oLSuGWsp1vUr5abhYbLd76FLig+U4bqs9y9
 xHleM7azZlvyxLJufhGI6CIBmeX+VJrQLtF0q3LS5q8gs9Vg5fxmMlZacxgfum14Ov/PaBEy/Rn
 itX+N/nOT1Pm3/fN54NZF8tB/v6/t1Zw/faUwhPzn/24+h5vr1mgg833/Wtdm34ovOji7TdX5Hc
 bhb7dGAvi2oQ8nSyvLpK0D+uxgrLTl3LsTPgEhiEOkhK9meIGJjQaOSgCxqHzN+ho63thPadANf
 nZ1mBL3RkXapNYWhUdw==
X-Proofpoint-GUID: OCV6Er27hjooMBAikA4AWMxRngqOxkDE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240042

Add the TLMM pin controller binding and driver for the Qualcomm Seca
automotive SoC.

This series was prepared with help from an AI coding assistant
(Claude). It assisted with review on the device tree, bindings and
driver (formatting and alignment fixes), rewording commit messages,
and running the validation steps (checkpatch, dt_binding_check,
dtbs_check and W=1 builds). All changes were reviewed and tested on the
Seca Ride board.

Yadu M G (2):
  dt-bindings: pinctrl: qcom: Add Seca TLMM bindings
  pinctrl: qcom: Add seca pinctrl driver

 .../bindings/pinctrl/qcom,seca-tlmm.yaml      |  135 ++
 drivers/pinctrl/qcom/Kconfig.msm              |   11 +
 drivers/pinctrl/qcom/Makefile                 |    1 +
 drivers/pinctrl/qcom/pinctrl-seca.c           | 1705 +++++++++++++++++
 4 files changed, 1852 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,seca-tlmm.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-seca.c


base-commit: 3191063649dbf7c0d0b768e1f3655e4c5fc6edb5
-- 
2.43.0

