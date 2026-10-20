Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513844;
	b=Q5kSIl/1obKr2pGNqP3tI+7oZIhgLqnOQDKiaMpp92Q+WgqvgmeeQClJWNQ7xATJxOLH
	 bbX3TyDeLklsEHkiCXsO984hnetsHK5pSKsly/QCZVlrUGXt6iYbckbqPAR7hryuKkpBP
	 JEXb6VMo9/+BrtAwGbIelLim4Fn+OQGJyrin030S+v4RQeKQm9nnAzxjfU2SP/fwxmm+f
	 yKkW9Vsl7s3FDfw8VdN2GjVrjf4RviICXtRaM4uwx/EJkCN5Gulvd/kcSb+S61Yw0AILj
	 1BI9vPpog1spETfDutxdC5/JpZ61+jsUGE1Sp2yGWq74KHwf6AV/woxczd14HLm7+YA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
	b=mi37apZGL6Cj1Is+L9lDiyA7+uc0fyidK3dVv4igUocWJI1DWefHWdCNodUoSBcmRvPT
	 YR5z1Ezc/OZjZ+jLL+d+lOnTzj+KxHPygP/GYADRAY6WndAYv4peboK9wGcSDGAI3CSVZ
	 ZpBiuHiQHU2C4DlsMYYG7RtZAmZrLGH3sAKHTBV6pi4Jz8UlmC95r/nBDAt1xxg7G92jc
	 A1OZAt8I9a80cftZbPW4mPYzj0SDjVsWwfpbb6/mEaKCY4IXoinDKoivuLYIyzhQ7uQxl
	 8Qb5x7kyddBdFTy8CtRAxytnpOjWByRVZiNbIfh9piHfcyVM7bBWZ9y8uSgJoAFw2sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6TsvtST;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl+eqbzw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E56F606A338
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E56F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6TsvtST;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xl+eqbzw
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDALH02214674
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=UOP0waMM+sHxlrwH6GNmYM
	DDdAIctadssvGweIo5pH8=; b=U6TsvtSTx4MkOtTdgMtB1yHOMtDA9I/gW726oX
	nvOujiXw6sZexFMejeuw5CGHWTAO36R1h1UyUkIzljBeALbnfyosRGB+DToBEVbt
	42z2SXKTEOwr9rCzhwJrjtm2hNgDn7oR1mGTi29Z+mJYBMHzDqQHYSLVsp4WZ9Wm
	5I32eMybyjlaAhz/po7EUv3xmAEtopn0cu604RVDujr8ICzw/zaljV2tY5vqN1uX
	vN5skCMJ1b5L0bM4koftls97cYhwHrSrJ2aJKfu/AwMP4pe0xM2ApC4iE1b+13Ys
	qzgoA+WVQiEmiaYJw6pBpR41ajV6DWxCbSCl3kIc3ieuOslw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nub3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso6426547eec.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513837; x=1793118637; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
        b=Xl+eqbzwCfG8tQr0cUEkPnde7Ff+1t5mWt3FP8X/83yBEhVt7Yy8cow2LCgUKNkp6t
         kMyXohxcbquW+nIwCN/50MN+h54hp7O9zGYHOoWhtONpGibRtsjXfD7/bxL4CEcCem/O
         rdibS92uZ1uCw7sJIzF8URACMo+q2ynwP0SZGX4m9odj4G/ejpoMr+4kKJAN/aO/cnmS
         ElNTY0WtJ6OGV/dz6JbRCJZ49wPxptuXf4gH3oKQpgD7q4oSkzjEbs6cDKT/bjP0k5JH
         XGCG8itgjz5aftQM2CY6ViueUVunh8uHXuh5jor+v9aBUmPDNmjMx2zYSSl74jqmwo2T
         DELw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513837; x=1793118637;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UOP0waMM+sHxlrwH6GNmYMDDdAIctadssvGweIo5pH8=;
        b=1mzMF+nmzieGLEFgdMyQ8U5FyAMCjrKoCxoCpIn0CTQP2J3WG7Cwff8kg/O34BQBcH
         QENGZq2PgLqE6cEazPYPCbLPLfYmNPeQkgAc8hN/0Zb9toUJbtaJ4U73Z/elHAzjBGY4
         q/+TL1uM5jP/BpfAP5lb8AqGha2UrvED0c+4Jc6E773W+XxEKTZg2+LcbuYywOdniWVr
         Yq6R6lOPNcojZQH9mD5JIttbTAv7UYVcEO9tfh07be5HL4Nb5Izuw679dz2DIC7x5EMB
         l7IL+4/0NJfYuLhENgN6lucixX5LJef2+gvWTNWfe36fH8jvocLGrkTlzTbSEFn9Urv4
         Mv5w==
X-Forwarded-Encrypted: i=1; AKwUvByEx9jSxDUQY1hXqYVQW0Pw8/EosanQA34BR2u6Xrv51Sd12ILc3X947my/1NW7yHrFQC2N+8yk3vdB@vger.kernel.org
X-Gm-Message-State: AFq9FYKsLPMC0cqqxZoN/lyJ73PT89JJ/e8w88Y/bfAlLSKLHRbKqffo
	bDTJ4BO4isVheavAxY6qhmD+mhPzqrsr7MZR/2CSFRP/Zit3feptjofck05xEyIQupbHxB7Ptw8
	5W+IwMDlU8qkGiij5+qqbeEFSdXQ5Aq66UmIIkV9/+NzS38Tf0l7d65Jgl42UVFVz
X-Gm-Gg: AYBFou3HUiRi7A6ZvsQy9OhYoNFMEPc0i6KTMI/9JDxa43xLR/i0nKHks4KySlIhfu3
	XJyuE2eDVcJZ71RPYmSnJs+UYXlUZalKkRj3M3wB5oknHh5mkJa3kwEu6gZP1cxI52LXPacWwFJ
	XHycIEw1f3rzlzXJsefBlL+lRiTy6rtw/2x5dN+FJZc5hQ15vplBw6renzZTeECFJRocvb0SstS
	etIXoq8ZS7FG3vtE4suwtQwh/pKsOzbKFyZ7GjFTQsntyBTFpUzNKYzAZQuqkbeT7OFh/jnhunZ
	fYm0ajZ0nh4ACvnHc6MZM+hA+FJ41Zsm3XK+wE9VvcfqhrMP+Ylc2ANesxeTUJFhyUvCdcFtpm/
	tc4JZ+HAX5p1XE4oGGgtpKQC2nA98VIOc61H0Gm6UsRVIfjTPQN2SHEK+EJE8Bo7ZrFMnjKF7W6
	Y1FCSv7W47thtGnBEXoT7fRW8kOB1W2GZMctA=
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr14599714c88.19.1792513837234;
        Tue, 20 Oct 2026 09:30:37 -0700 (PDT)
X-Received: by 2002:a05:7022:f90e:b0:151:2e62:fe6e with SMTP id a92af1059eb24-185136cd2ffmr14599624c88.19.1792513835419;
        Tue, 20 Oct 2026 09:30:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:34 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Add LLCC configuration for Qualcomm's IPQ9650
Date: Tue, 20 Oct 2026 22:00:25 +0530
Message-Id: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACGX12oC/3WNzQ6CMBCEX8Xs2ZJ2tfx48j0MMVCqrAEKXSAaw
 rtb8Oxlki+Z+WYBtp4sw+WwgLczMbkuAB4PYOqie1pBVWBAibGSMhPUD1ms5b1pjBGZPFWJTmJ
 M0xLCpPf2Qe9dd8t/zFP5smbcHFujJh6d/+x/s9p6f9SzElLoBO1ZlirViFfHHA1T0RjXtlEIy
 Nd1/QLo6oBOwQAAAA==
X-Change-ID: 20261009-ipq9650_llcc-903d7576288b
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX09sUYFtYH0u1
 bMx9KsxJSgc9GEzjXwlXmCKHvwVvEPHnkKw49Z1qsHaVSBt0IFYFtP0d2rhyqcel2ZR09yjMmbb
 It+lHplovEohZdb80KopHHs8l3jYNXU=
X-Proofpoint-GUID: fxr1Gr3T0ctnWRLDoaEMarpjxAlGqFhU
X-Proofpoint-ORIG-GUID: fxr1Gr3T0ctnWRLDoaEMarpjxAlGqFhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX/oTcBwsC5Q0u
 LaJnVrVC72ZJpCHizzLEDuYDDZWhrigz9pIS4OO1HYJFrVkroBujg/VwZTC+D/Wvzvr4fMlj4Rw
 mE/v84HXqf/o20K8isWBdpSblIicMgSuzEYdWsqcTcgl0Yu4cOeWx6z+LsqyNxxXHNZLq55envj
 eA3I6+VuskndpVyw5FrKed96ouHISQ4N0EkmNOnSSrBZoxonQvRGqHAVpEUoep++kPtG6Fzc7hy
 HTzHKyJg43YUsEfPiFfd+nwXwMlDlnNgvO+eErrqKhB1+n/lg+s/IvZ6bk4kvLvKv/rrQDP0NKH
 VtA1EecjbIzvBOFzgktLXt6ajEKkmib86BBRX3k9GkaNintKT04U0F2hRLk00OvJOnk4OXhDVMn
 ysWFmYUXCh6EMd9zdeyQBWf7nq12oi9Kf6Djubs8f0CLnFaHkeuymXJu0MaefNTOALRWzbK3AcO
 tc8LuEd0nDANxBjvjXA==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad7972e cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=_9f8UQ2UEQgcCYNCZg4A:9
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200065

Add the system cache table for IPQ9650 and the IP version is v7.1 but
similar to IPQ5424, there is no broadcast region.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Use lower case hex
- Collected the tags
- Link to v1: https://patch.msgid.link/20261009-ipq9650_llcc-v1-0-572e40b18522@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Conor Dooley <conor@kernel.org>
To: Jonathan Cameron <jic23@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Kathiravan Thirumoorthy (2):
      dt-bindings: cache: qcom,llcc: Add IPQ9650 compatible
      soc: qcom: llcc: Add LLCC configuration for IPQ9650

 .../devicetree/bindings/cache/qcom,llcc.yaml       |  2 +
 drivers/soc/qcom/llcc-qcom.c                       | 76 ++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h                 |  1 +
 3 files changed, 79 insertions(+)
---
base-commit: 8f7df005a7564bd7ffa75da9c3085d5b996f1e16
change-id: 20261009-ipq9650_llcc-903d7576288b

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

