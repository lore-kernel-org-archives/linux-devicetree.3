Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3880F369204
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846125; cv=none; b=rX8aKSlMqTNyW6pq2LFDRV95Ai5ab89yHkx2l5Nq2CYO6BcYrVRFqcqwuI6dFfOQtrpuUQ2KZaOVDIbiJnQyMH38tbXaK+H3RS66kaGrtU23QM8V48hoJbfUw/8LYGmhG5kq8YMu+PRG2ocf3HcypzdagC+rxNOs4ZC1jhrqP3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846125; c=relaxed/simple;
	bh=vWAiO5ukoR6rpqzNGRamt4hXuS9ZYdSTlSxOnKCYJ68=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=fU44tayqS4UYkFbdi3dhBHqGgc1ZS+2+EwikH3IOHyr3+9vr1eoPJtcMXWHrY5LZGAtibteojCw1qnL/4vy8gtDx+vwqFJmQuDBhQguh7IcnfjVD79spGwiIqVCsb0qeDKRmBLo04SMc2idh/11Dufhx8nlNDy5KYTG3RB0umUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xx92935Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/V2VevF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xx92935Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/V2VevF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748vV0b325561
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:22:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wXqGBaCpJ7EOJnW63MljrG
	Ah543GqrYnWJdN53rLms4=; b=Xx92935Z/YNfLo5rhfN3HKY4jnC9XMfb77wEq3
	npyuBeWO7RVaqK1CtDQArCf3owNJ1NrUjbILK8gtMNUZ/R+wN8dPEswwoEKtMliZ
	BNc/vt3WnzvuuQlomTpqI7jYriyrVnIOHj4nokgqI+gsUZfnDUs2AgrmozR7BobA
	N5Pcm2kI00Uyz1CVqD0oIwNNmTzwga74v45N+7a2Ils87xuLqAxp2Qk1//eSqayT
	OM+5iZ2i9K4IFN1VLafNFi5usM/LI6HhFMGryFyfjqyl5o01y21r6u0Lct5I6BAs
	80LLmXrw5ECkbAnRsduEliML1k3PPf5VrWGPlE7Oyj8+3EQw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fud1dgrg8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:22:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d137a68so24980491cf.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846122; x=1786450922; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wXqGBaCpJ7EOJnW63MljrGAh543GqrYnWJdN53rLms4=;
        b=T/V2VevFqbPYLvzGuzibSFJpDXetzOmjom6/7SZs9hJVBsPytsiLeBBurVpYD25gpZ
         8Z4/x/UriaE6+mVKWnUEaa57AfntCZzzGBT8rlCRPbpEKmqmQegZPi6RozqIIm8IQcTN
         EfZ+6IEfqgK/9bdmwVskzGwy3R3JaXE3nwqvgvns/iWvomHPw4YiDdVacc9ddCWLYyqf
         qo9FVbaqzzVUiWgNiuYWRL7XjOf2j/eG0cDhstvMnmTMBDGJER0Qd60t8uSj4WsKlOkF
         PoMXXRH8PaF2YxfivrcBcECpc10LwvUrmN3vSCL7/qxv9Z4AJstfn/0z4SkD1oY774Er
         QUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846122; x=1786450922;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wXqGBaCpJ7EOJnW63MljrGAh543GqrYnWJdN53rLms4=;
        b=Hh3K9kH3yWOcVtnGOpH1/nHAsadaIApWoW856WkP5gz60HAuZBIVf85ijezqqYcGBp
         AWk3dDrnQ7Hrb5GXP4MhEYkRASvAWqrpYKfWocmXorf5vYhSbLM3sEuCQ8DO5/tzwk4H
         NYqof5QSV9GlEZXD6ubOrDzxQ7T11MQUZx8jei9iC0eERS8Zn3VnT5RK8glqmGveP/p7
         oF7UnhignSWnOysqexDo/C3lGWaYRFWSUA00UDR9nyR49sNzKzsMKAWIUTRjcNJ5Fh7M
         1ZJRfTQ/OtNXye2prxeCisa7gHYJUC9ocwrvPAjPN0TkP4UHP22atvJENPwZra4k4NeW
         PijQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyIauTVuH5kedX37k0CiPZQS06YuE3/BILsUy3GPkHIrx54wyStoedM111EsWbzXvmqeJ1tUg38GCw@vger.kernel.org
X-Gm-Message-State: AOJu0YwaDHBcwG5X5ijKk6KrWnjK+D0SGYnhKjIKS/4uy/Bd5a4DkA6T
	vgHuzc9D5MeSLWQTL0w8wc/sJUSERjk835KfKY+PDJ+/Hwn0DtMwi8o8UgDVLj3p6ETCfZb0oX3
	KG6LX7aukteMpjH7GcxJvOp62TxwGW8q7xuQyyC8wx1QEkQE1y7Bshuxoak+bHRGOFPxRBXhSNk
	s=
X-Gm-Gg: AR+sD10ICDFuD2iv3u7Ocfxce+EoVwZzNcfFCvB5yc9QHuY/zE+8pXThfv8hmhgmsga
	x23K85X1qIO5tputzIHZt8VRgcZaGwJn7D3smxvOPV0aLk+9VRfajIHe0qnQohD+TmrilvHVWv7
	TGjVwX6U2vdGGx0aZAqJPyCLbzRdnlFmP16htoIrvCGr+W0L6If4+s7cwWd2Cl+KidIQmscIcmo
	Btj5YFM4YBLS9HRJQ0BSnbPk9ofk/c0xojITAa0rkk2522AOc+XfqkE9bh3mDM/a1BnVhaUlyNG
	ju2FK4E3CaHugNm2GPmgTRclji8B9uIvHxXw9S6Zf0QeuwTcfk51ULo5G5DLGku/RJUqwR7P4ji
	1p9UDxKA=
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr252748551cf.8.1785846121970;
        Tue, 04 Aug 2026 05:22:01 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr252748071cf.8.1785846121429;
        Tue, 04 Aug 2026 05:22:01 -0700 (PDT)
Received: from hackbox.lan ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41cf404sm42940134f8f.1.2026.08.04.05.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:22:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v4 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Date: Tue, 04 Aug 2026 15:21:39 +0300
Message-Id: <20260804-dts-qcom-eliza-add-cdsp-v4-0-fa593983e486@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPZcWoC/43OTU7DMBAF4KtEXncqexzHTlfcA7Hwz4QatU2bS
 SOgyt1xyqYSRLCx9KQ33/NNMA2ZWOyqmxhoypz7Uwn1phJx70+vBDmVLFBiI62qIY0Ml9gfgQ7
 504NPCWLiM0h0rku2jS6iKNfngbr8fpefX74zX8MbxXHhlsY+89gPH/fpSS29v1cmBRIMGrLGe
 tRBPvXM28vVH0r5uC2PWMYmfOBQrXNYOFJkMHRBR4UrnH7k9DqnC9dqUpYaZ7Wrf3Kb6p9MMNq
 glG3bUPrlV/M8fwFFWj7bvAEAAA==
X-Change-ID: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1553;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=vWAiO5ukoR6rpqzNGRamt4hXuS9ZYdSTlSxOnKCYJ68=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqcdlVV9WQCOuS8HOmvLlJiamW5y2aB1+GiVkeX
 5zxkTuCpJGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCanHZVQAKCRAbX0TJAJUV
 VunMD/4mr2WyaXMjDgG1YLiBfEex3wIef0npW4LnA+bC7NG2KhnaPJunJWvkUphUtMT6+xPT8M+
 4Ha9y3xoQvzCBhG37ReG5oQ0G4CpOW1gLvmPYmZ7e7Sy0h2+uWUah1PI4kcrHGExmcMzERxnCU2
 o0LoBq6CEPEkRORKhZz7tvmoRMg6jgbrGqW2fp0MYI5UgnAoBXLhwlTOEoJtTGU2RJTIXUCfoge
 KRppzcXWikr+4rJfIXbkuvwz2TZxDujXkbCHvEyqk6w5wXocQ2zIGFDk1O8LE1WWgcP3N5Qc12Y
 XEgmUaRUVnXf0wz9I3xd/HsfvfoXmeGZ31o9fir8vZfbQ8yd470ShaGnTziAsic07VLxNFpV0iq
 tz/krA3CZW8LjaWiMj56fPSOUq9UugVjpkq+zYPC4bjGSRyiVbRCtXW7yeJFlPD10TsI9CJREEH
 +HJLbfx4Lfih3HhJS8RqbGPN+qsEDUN8jOs3uPPIqRAtkpceSHOBWRO6fg8jvpaFuRi5qRUsFsc
 moZNvTffBxJamaMYfrUcPslCU8niEGEYWJs+yb09JBQggT4NQu7NVPPyWROTQIB1q8UWMgHyZuW
 tyXVF5wSqIQyHIal4mzalEJl/L5S3wS1GiXUYpsy3DIwdWwaOsDkiCeQajM3iKHBbAo0eog6pcJ
 pGAxHfQPpauw7xQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: JU92pvvgPDb8bq64eHh09QGp5YnVQat4
X-Authority-Analysis: v=2.4 cv=SJRykuvH c=1 sm=1 tr=0 ts=6a71d96b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=LR_dMP8fg7ejCj7yXwoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JU92pvvgPDb8bq64eHh09QGp5YnVQat4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX6gEHNyG289e7
 Jj33ZtniUsLLANvNAmO/+jN1S+teMFnAJMWM7VkkXE99RcVUGC7/zQ0ENc0O3OLxbyxnysEpOE6
 O4Bbc7RnjkcPUxsUCEAIcfvjU4uzc+U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX8iIEGcr7OJMy
 qsxPvjWEFJUzxapeS9DNAp4d8ldJf0kxlYFtp63s35u0YLV0vY24nCq4gmBBvy+WpVewGEqvrCT
 4ADc/2jvlqnjPSGt4M9bFRofYKGAwcTorTtDBTcVLIzaH3LTOwjWS1IQazE8pt3l8o2li7O1dRW
 kOL8DUJtaaaxYhGJyGTl+LrSy2CB9Qmrmkq98/3ughTe189h+AiQ2Q1aEuEE8XZ0X2O557LBKP6
 H6QkTqqR+dQqKv+EF1XeUFRAKbkA01/a4MF/+eAmnOS72FyjTlIjZOq34rZnmqpTjcxmD97Tah3
 GBUddLG2NFX7+6RZGkSDEYLmlmJ9AIsadiEU44BmbuNiWm/NTudPaObZklbR7Y3zbXUdCXk9B/V
 /rU+vu5c7Kpj39VHhjDloEFRz/Z45kUqsctleWf90Y/BExa2uKS9PpkA9ie8jgA/xTQIj5EDK5u
 tt9KxKavrvpPyokt+Vg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040099

Describe the CDSP node, the glink-edge and the related SMP2P, then enable
the CDSP on both the MTP and CQS SoM.

FastRPC node will be sent later on, along with the ADSP related one.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Changes in v4:
- Rebased on next-20260803.
- Link to v3: https://patch.msgid.link/20260723-dts-qcom-eliza-add-cdsp-v3-0-b535200996ed@oss.qualcomm.com

Changes in v3:
- Rebased on next-20260722.
- Picked up Dmitry's R-b tags for MTP and CQS SoM patches.
- Reworded DTSI commit message to suggest that FastRPC will be
  sent separately, as suggested by Dmitry.
- Added the GLINK edge node.
- Link to v2: https://patch.msgid.link/20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com

Changes in v2:
- Rebased on next-20260720
- Picked up Konrad's R-b tags.
- Link to v1: https://patch.msgid.link/20260714-dts-qcom-eliza-add-cdsp-v1-0-525e757a23b0@oss.qualcomm.com

---
Abel Vesa (3):
      arm64: dts: qcom: eliza: Describe the CDSP remoteproc
      arm64: dts: qcom: eliza-mtp: Enable CDSP remoteproc
      arm64: dts: qcom: eliza-cqs-som: Enable CDSP remoteproc

 arch/arm64/boot/dts/qcom/eliza-cqs-som.dtsi |  7 +++
 arch/arm64/boot/dts/qcom/eliza-mtp.dts      |  7 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi         | 75 +++++++++++++++++++++++++++++
 3 files changed, 89 insertions(+)
---
base-commit: 9a4cdc958dd79fc6c3b20b51a10debec6ca09fec
change-id: 20260714-dts-qcom-eliza-add-cdsp-0288fd79c8c2

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

