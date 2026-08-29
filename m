Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888D53812D1
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788033216; cv=none; b=VXYp+GPznO/aEzIyry1hkj6ghBcY386MrlLfl8J0YuXKAdc16XQsIiX+0OfiTfjhjGN2S0VVINhZcco7JQiYHT9mqRgQCDr7lUdrzTmmhEO7xzy2feqihGdBD5KEdcwzsl5EbtkU4kaa+0+VYocF8l7zdWqy/CPITSTmZ9g3D0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788033216; c=relaxed/simple;
	bh=TVcXu7RDJopZcJee2GwdYLHMG2S13Hmlkx2/yEL1aI4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZY+He3VLSyKIrraijcgt5Vja2vWgLZpAiHNRvaMhT5tFTdB2ETAZi0eCDpe8Q7pwIXDOS0Xg+GusLdN0TvPmO5Wr0GDmCevSknbHTYpw7G8oCWd6Y1BjvRCmlDLvU6yRcgMKXiwbUXAicPfn4q7G7K9O8+R9mejkrE0fz6IcjDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ho/YZlQc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eflLrgM5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ho/YZlQc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eflLrgM5"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TJkuKQ2171215
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vfurxFiFyne+wCoshVktX4
	1VWBdR1PxTmnAj3EPIz0Q=; b=Ho/YZlQc8SlY3veRfOhDKXNKW6LrUq+pig6QMh
	+CG3llG8XgxPlGewSVOop3oH0UlcHSGaoCf1Bfm81HgcVdC4SCF06R+f6rgw8c4v
	kkvvUE5WqPQtvXDqJpoW9/ynNeAHAr16SVYR0G6NPvxknBmUrgDcqUZoFtwAsm4k
	XYEy7ZyrNaluw5yecSQmPND2Bfsfn508xcbfe6GhZjyevw5J7k8M0EogO8dYaQxG
	QckSZ/M3QP+bSV8qLPZUAkfVoFd4fM0d8Ay7e9UJ2A3t9SwxaTI2i6YsmVDvC45l
	4Wcylg7zSEnx1rDdqHWo72bGlo6rf7o25LR+9pF7gk6DidrQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqt6hmah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 19:53:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53000c06184so11555191cf.3
        for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 12:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788033214; x=1788638014; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vfurxFiFyne+wCoshVktX41VWBdR1PxTmnAj3EPIz0Q=;
        b=eflLrgM5thgrHsOHtBThqXRy6PO0GbiTTOc5UuF4Bqry7evE4HnWzRp3M64b3ikxLq
         Opjcw+MgErVVT+/R1sC7eZyS5CvI8JFmeZftyUYa/7Zv/+Xr08XDBadzbGoA6DciK3n7
         SmwwP4VGDTwg0nThzfzAKfbUpxp+qrESkKkbwmMuD1p/kuQvf3/pPcR0aG1dfMgg7a/l
         7Bo8+6lQlgnOTEe08h0GMA6pM0jdzJMrOlqBtL7F6R6RiuOW2fYiugKwPKfks7rIefrU
         XdilYHi1o5V1SpqUn+Mcp9FUj5JawvGcXPX0NnuGt7UwBt4abIUrvlMXfS7jh0WRsVrg
         sodQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788033214; x=1788638014;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vfurxFiFyne+wCoshVktX41VWBdR1PxTmnAj3EPIz0Q=;
        b=h+lkDFEt5mIdtL7d5oOmNW0/Db3XFSyi6SDZxVIjJPVtc3n8ZYDVjaygImrQpVBWFB
         n4w0E/haibXA1gaRQbBVCA/ala+HqNS1PFP+ypDkJO/WnXtSbztgJB7DylypUR8V2Xdn
         h9kvrmyU7IlHQviUN809Nr7Dbl26pHFYM0NU2KUSnU1bE6Gnds4IsKlk4AAjfW+3eWH1
         BtaHrNV3LmiSe2se5A+Oe+BeqXyotxkNsqoHJW1Hb6H+cOowzGcaWoh//sdFEb5FsA8w
         BMc+sGa27xlX9CysZfW34knzUV9Gyzf9FaeVx4ukcZneE4bB5UiesQoEacskWGwKcuRL
         LEvw==
X-Gm-Message-State: AFuF++loncKxjO6vdCSBscoQ6cx1l47nQfQ4nPlFkSWHJwxdSi/NlsuE
	eelJGkKKhLjywx6asvcEUbFcaemOUyQDjGcBraAGh3AUq/O/TrTn/PJJYmiLsDugQ00LM9KWTbc
	/CEXXzooi8NDduKxthyOjGrDdabEojpz1ymxEva19cmq0a8r9lCfIDDFMgZM0g8Ts
X-Gm-Gg: AR+sD109cB2FROMAw9eJf2E4eB3DLzXTBvLPPM2wZ5zwMDXPb3lz0oIBe4DxJGffgu4
	iYC3IXUAtrnQpNdTCrHEaHZQmCAYNAkMOx6lxL84bDfUpDTynYhvk+NMP23MMarwHTcMW1RBJoZ
	jcmYGVg7iAcBs75zwv5JLJ0MHfFbCV6NX/qKelqPFDwYUH384LZTMVzo/GrzhvsjEYeqJohUo2Z
	uZysPhTg8GO3cjUAf5bhXIBRufc4Xu0bsZ/DfrVfV8lIcZxvuUTVUHtrUTpDcZlaIxDMorRonHC
	/fKTtOz+67Rs/QsabwS+iiLm4yfOtMDM0aIQTXWVu7Y6+2hpE8fArNMkEgBm1eb53OXsZdmYmyb
	EEhZfkpqciHVp6rcTGgu2j4k=
X-Received: by 2002:a05:622a:aa81:20b0:52f:f916:b7cc with SMTP id d75a77b69052e-52ff916ce9amr41637451cf.0.1788033213686;
        Sat, 29 Aug 2026 12:53:33 -0700 (PDT)
X-Received: by 2002:a05:622a:aa81:20b0:52f:f916:b7cc with SMTP id d75a77b69052e-52ff916ce9amr41637191cf.0.1788033213146;
        Sat, 29 Aug 2026 12:53:33 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb32d30sm12446343f8f.34.2026.08.29.12.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:53:31 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/6] dtc: dt-check-style: Cleanup plus new checks
Date: Sat, 29 Aug 2026 21:53:16 +0200
Message-Id: <20260829-dts-style-checker-sort-v1-0-6693a37d7ae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQ6CQAxFr0K6tslYFdCrGBcyVKka0LYQDOHuj
 sryJe+/P4GxChscsgmUBzHp2gTrVQaxObdXRqkTAwXKQ0k51m5o/n4wxobjnRWtU8fNdh92VBR
 lRQRp/FS+yPgLH09/tr66cfRvbTGUX3169EWb5w/ro3vZjwAAAA==
X-Change-ID: 20260826-dts-style-checker-sort-349052778b22
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        sashiko-bot@kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1611;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TVcXu7RDJopZcJee2GwdYLHMG2S13Hmlkx2/yEL1aI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkziyG6xBaHGCwW4wqM2XSbZRciAc/7B3w3c6q
 53UXlnXw9KJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM4sgAKCRDBN2bmhouD
 17wRD/4/WIy9COi+5eYKXVn4KP652+IlUQmYfwPiUS+7vKFAcQmNNtSThF2I8W7F2wqcyHff4hb
 Z8eKY3enTij5Dnzz9GwluFV1mPBmIimn3P8bHGEmw8fcIq8tdA9WpSMS/ZssOV5VROGleSnmbBa
 zdMDGnM56aNC1WiFSIAcMPiQCIEiXeIKb7kHBw0Wfo+5WmwWZafxzs88jybDXotl2se6PyXK2o2
 FsmzE7VVZ0yTSFz2Ms9pXCvU7nRv2KAXgA17lOrtgxfv85Sk9FfPYhgTX+Gm+jHBEvESYNwv3I0
 ij9sh7qQwO/xZHLCCVn4MAA2s0l4U2QtbGrRjNDKWqGK0VVr/lXNTRMX9Ag9tS4t+wrJdKpLR8L
 sCXaizQ1YFmduZjTYejgEl9KFckU8eq5ASA95cZe9uysX7K3atIodY0eWJzNnfxvcE3BfiTWn1O
 8AkWxkBNrMGvyqycxLWJYukzWAICY/NjB3UWq7HkIhSiFauT5MdHE/hYGQgwd9/HeT+haVTwiam
 cjOBmFSMOOM3sbfGa5lCQ0KGswB2qmb3ajLO1vIjyliSLWXvDENtxWfhlMZ4Ioa7Fm8OaxP7Cq7
 hC8Z+/aAEjQvRUD2WeuBNnZ0LlfHcTqm5NDTPqR9ivQANp9zlmHxom66G6Hneiq72mVUrPUhVfY
 5+wu//Km+5KRC0Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: TpJ0YM8HezuAchx0anyXDyDGtOEqfvCM
X-Proofpoint-GUID: TpJ0YM8HezuAchx0anyXDyDGtOEqfvCM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfX+X5U0Hx+koSg
 sBZPlgPbGM7bMEwdAiaBHWNSn7pq3eolCrLBxkUkK08Ub1G3fh8Ltpj5Tthrec8MCGI+kxdbeVU
 GOMSywsrNz40aj0nlUrp4kvd0mGEgZP9yF6SNm7x/XzOU9PvVh4kE5N7YLShD3AeWfCtXZuepzH
 ERKcy6cL67uPnRzZ+krxwf8JpoAAkOSd2h74pavRl/Ur8OLW72B4iFuT10nV+lm2qGF00pUuUQc
 qR3Op6q/S68XlzGNTGfeXpKaqOSZiypNuCNGYjIUGs1CtLBAZg2e+z2SR82XpS5btEAn9Mw6/qt
 XKZ8CGDG91tP+vEFT79wajfuXEiTawINAE66e4vFA0KsjTNM/h0yP0/0eg3thnIHPqtTf94f7ts
 Nsj23QWmbGSj8kQqFdX0QEUawUTbldi0hvWCMPxUwl5Rb5O3QAuYYeTta29VwzsntFmER2MWEbR
 xI0An2CUWppkIETwqhg==
X-Authority-Analysis: v=2.4 cv=S8/pBosP c=1 sm=1 tr=0 ts=6a9338be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Ti1yvCWcEA5xIRQRbpsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MSBTYWx0ZWRfXwp6E3ImR+4Dc
 +rAbIi8KoOWnT3mJTJqcqtaM5p0eTpxvgDrk+JW6gCha5kMXxoPytijR6qhXPmTBd+EoZAoswMe
 OCT+W12pA9aUqUuu851hyQgvHS2T/KA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_06,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290171

Minor cleanup, more checks for node and property naming, improved
checking for whitespaces/tabs in code.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (6):
      dtc: dt-check-style: Sort rule directory by name
      dtc: dt-check-style: Sort rule functions by name
      dtc: dt-check-style: Process property names with a question mark
      dtc: dt-check-style: Add test for node and property name styles
      dtc: dt-check-style: Check for indentation also in continued lines of DTS
      dtc: dt-check-style: Check for indentation also in continued lines of bindings example

 scripts/dtc/dt-check-style                         | 740 +++++++++++----------
 .../dtc/dt-style-selftest/bad/dts-node-name.dts    |  60 ++
 .../dt-style-selftest/bad/dts-property-name.dts    |  28 +
 .../dt-style-selftest/bad/yaml-mixed-indent.yaml   |   2 +
 .../dtc/dt-style-selftest/bad/yaml-node-name.yaml  |  54 ++
 .../dt-style-selftest/bad/yaml-property-name.yaml  |  46 ++
 .../expected/dts-mixed-indent.dts.txt              |   1 +
 .../expected/dts-node-name.dts.txt                 |  13 +
 .../expected/dts-property-name.dts.txt             |  14 +
 .../expected/yaml-mixed-indent.yaml.txt            |   1 +
 .../expected/yaml-node-name.yaml.txt               |   7 +
 .../expected/yaml-property-name.yaml.txt           |  14 +
 12 files changed, 629 insertions(+), 351 deletions(-)
---
base-commit: a5795bb908d1b8b125a59bbfe9f27f93929dc647
change-id: 20260826-dts-style-checker-sort-349052778b22

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

