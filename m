Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABC3AFAE4
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785747815; cv=none; b=NB1Egj9yD6Wn/698p/m+ZIiK6FUtcZP3l6T1pZVFnKPstnBMeEW3gNCYCQs3Kslxer5EyzY5fNAlk4lnNRMG00ZwPb1uz8XpTGy3r9dezVsI8jvqfxyed3eMDl8a6j7zP/VsZitHeuuZvIjKWDKWpvvY5/d0SiQBYodQIqafPUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785747815; c=relaxed/simple;
	bh=NBoOHLCKiwpdcCjt61jVYvdfgFF+fcrinVA9SUP6bJk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T5fcPt7mnY4xeix3okRV+JzggQJukBVhZru77kMTqoxHydGJCKY3yWppZeTl3xC8EVux/9YC4nAew9PL0XGdRgJOvYIhs/KFTb46UQ85UmmjwCOVXKjIYru1z4IkHDtFp30vQQM26aqjoyaNeggoHxKMzlVXVxJi5PTcrj/CxUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KiQP16iG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YXbI03M0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KiQP16iG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YXbI03M0"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736Db9Z3882610
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 09:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DCm7VxWURTk36qiObPoHI4
	Y03gZP4qRRyWfUJGJ4Q6s=; b=KiQP16iGtN8+Gb/F3hBfLvL79M00B/UrzZ+xsq
	jNQkLDj9vhmPVfhl/+8MYEv2ESxdSP8J/0usEpanL9c8IYfQsjoPQ1J4RwI5VpVE
	3UVMQzzDtFdlnqRVfWvZze0YeD5gyJrzVw2NqIuNezWmJnog3UnfwZxQCw9R3rJp
	48x+y44zK2GyzdIxjGdOoKchSSbHpMZxaVexug3Mp2ZSKP8nbN1/AXQcreB71aW8
	EUT/NvrhSDxRcjIftXlpsBBRY9IAfCImgg7CcFFL7FqL7FbvciL6qLSbIXI2GalN
	hKYOU29q9ojC/XlGTvdGIdm4WJSNB8cS4tItwn2Dw3t8/hWQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnhkgqrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 09:03:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0199faafso31436761cf.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785747811; x=1786352611; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DCm7VxWURTk36qiObPoHI4Y03gZP4qRRyWfUJGJ4Q6s=;
        b=YXbI03M04J48DFP+kfOnStOF99sJ0GUgUeEsyoi1oiA33heNWcgbNiNcowuHzsV8db
         1d7vh5SHX+UXvvkNoPuPdmrSOH8J5/g/EDj9E9e60j3PF46XsWlG1ySn8VG99wtOJNzD
         x+jQlHCyOCbWiRSOPHu7ABvZuDhDJAHqRM2WdBc+K8fUl6OYxrFETkdKaEhv2c7yBnl6
         WfctlKX0Vd6fWGiOx0S9HCBTn+EFDUKAGDI9k/y63Wt0jQLoJchbltAYfVyu15jeUO6A
         FQdiZz85jDmvFsgBCjUDOyptz34RxZq0E773w1nRaEwfyUfl3sosYyNbXypsIr8YiEhn
         plwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785747811; x=1786352611;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DCm7VxWURTk36qiObPoHI4Y03gZP4qRRyWfUJGJ4Q6s=;
        b=XqaNet5nRegGLVYD/B1yqajNxNan0Sfh3qzGpJdMEFSWipRrGkTRuECHONtc9GOGyT
         NfBGTDf65ol+X/8WdLejn6QjgElKejGg3tsmUlR6cghmsRjkkJm05okP9ffYtt0dihJm
         xAfXwMFjbA3eZXNIePJVPtve4E3ls6TYSdo452jgpYeQTjOnWwpzsvatGnJj6zc9OcoT
         w1W2Vd1kPezy6JLdayMryLwE7cSMzLIXPoflOhDENhhV96fsi9DK+Ejz7LcFrGdR53hs
         Pw9VVKNXXk4MOwofzhVe3YRNkkYjD12a7cEO8qcLYGOyEaLPenDI00WUVrbXKwsAZAWG
         pvWw==
X-Gm-Message-State: AOJu0YxUguQxW2D9sKi98IYQPtXwqU4eA/CAco+3GJdcZxZAZvX/Wjxi
	+ZR1Asgke35LpD+3SHnWxpyNvDccc6wb7/Xip9suvqD7UFjFtgkS7NPeAOT6lTL+dL8CudGWQQk
	oZKr/dg6qrDDWaZ/dRhLfAYwPiamtR7J4bHjN2LPmb6fTOMhUHBhefKIBjIuIQgBSPVFvYNyi
X-Gm-Gg: AR+sD11wfhKYkxQbiGvZRT7vF0dHcAxci6BluLKd2sHqnWe7+fI0SVlxrRldNBmjdpY
	oP1DM2SGSlcmx6d6gibTUiRDz+W1CdmBcuUjEvewUCIjWRJTBV5UClU0j3Ink7fVNBHD14M7beJ
	hQ5WkmmOSzwU5tNmLTEh8dG4rNmkvn1LxdW8uBXPkWF44gN36J2WcNd8oBzV6AcOvnHfUwBorEb
	d2fdZOmTHjtxaNvOK2CW3ekLu/bXUJXKkLW3CRSw5iuzXwKbfA7iaEvxAD7wNfDpUrM6u2DQ0Gu
	wBTVE/WCUjwnmsQgyxy/ZcT+CO+TBUmaKe4A9f7DR/JDYLitHrOQ/nYqmWiUyv0YJvHvKLptnyY
	j/FhQQMlTe617mYvTdmsDWnMV
X-Received: by 2002:a05:622a:229c:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52b5667098cmr183399811cf.6.1785747810736;
        Mon, 03 Aug 2026 02:03:30 -0700 (PDT)
X-Received: by 2002:a05:622a:229c:b0:528:3b9b:4f55 with SMTP id d75a77b69052e-52b5667098cmr183399131cf.6.1785747810135;
        Mon, 03 Aug 2026 02:03:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd456a6d7sm31858493f8f.19.2026.08.03.02.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 02:03:28 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 00/11] dtc: dt-check-style: Improvements for false
 positives
Date: Mon, 03 Aug 2026 11:03:03 +0200
Message-Id: <20260803-n-dts-style-checker-continued-v3-0-6c9776928cea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OQW7CMBAF0KsgrzvIMcQxrLgHYhGPJ8Qt2OBxI
 hDK3XFg0U0luhnpS1/vz0MwJU8stouHSDR69jGUsPpaCOzbcCTwrmShpNKyURoCuMzA+X4iwJ7
 whxJgDNmHgRxY3cqaVGPMphLFuCTq/O3l7w/vzIP9JswzOjd6zzmm++uBsZp7/90aK5BgZW1NZ
 zaNbuQuMi+vQ3vCeD4vyxHz5Kh+USPVJ1QVVGPtrKsQO1r/gU7T9AT5UEvJOAEAAA==
X-Change-ID: 20260726-n-dts-style-checker-continued-b6a05e278891
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Test User <test@example.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5554;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NBoOHLCKiwpdcCjt61jVYvdfgFF+fcrinVA9SUP6bJk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqcFlK6wKMsUTt85kauloHCSGR9MiOIifN67PbH
 gfIu8hpSBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanBZSgAKCRDBN2bmhouD
 15eQD/0Z54UU5n2YYIPHAf345yrfGwthP/mNrU6lDAFzNpe8CTuCD8w8keOlucUalrRASjqnRGo
 VuRd44Y4aCWeD39flbx8d33Xx4A7oHrI54nQTpOpFrTbmIZIGh7GWNdJrwqCLWn9VxJPFJcWg5p
 jtwuxFpbsReBN5ahdkAMPQdr7ZacrPa9SRR+DpbgDi/4dUhK0l+3MR/JoeCYttLtEziUX1IQgV7
 BhRnJdMBNLqwNoi4uxlzqz3CbXNFqHkrbBVKVGf4MpBLi/1BSKZSHn4OlyXC0n690aesEYvNbw4
 iTGOjXpKJe8d44YDQuXw/nmwJc2Mu58+qo7oQy0us/2XRoQsg+GSidFsKYd8jW/6aiokgkLAjkS
 0RpGPfOBEP7v19O3VQ1z8/CqTRMJZB+UGAKSL/E3DGp76o+Dm99imklZTzVMrKirzU+iU9S7/Pf
 L3D2LJXMVUjiaBTQpp6vlXbEjTa0G/1ZADSFGD7eqRh7gwoPmVoMXRnPYmdZ7WXEoJWnY5GwiIW
 PPaXHjBU4z0n8by7jJdcDHrpqpdymljNSa0c51TfF8/CQy0UGh1UCScVmpQ7g/LEJO80POkr5mY
 DZXTHSUae/zLOMO2QeyBXhytRSqi7FdHwQ5n+N3eO5DM8YHs4eV4thG2CoQLnBvXVdoLMKIbsk4
 evuocm57YqPuDRg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: 4dZwshmX7EYpAVIKgt3nhnng5jg8hyjC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfX7rxNUwYWqimG
 0JvaIfthCYF72M/kfdK3QMiyWiMy8ZigQk0uGOwgBbI00jo2bY9w2vy3z8cLZtlTSDiU5DPDmC8
 tkRHTXhsrhxQBqFCnDZJVm5Z3TigUAe4pMlkWPKCu6salRtnQAuUyy2V187AT6uOgYFLUbLikim
 2kvsgxz0qaqBkyip7k0QM6DpfuhAzGazKGHkbcXQ+RxGzduJeYInNeySdj63URd/z71eIUDmn/n
 gaGILItI/RQsR2EaoOU+a4MXWXQuLymr11BDVpatr3K/3KTIqw9La2gUykd0NX/X7rb0DYpx/2v
 ajpsQQ1am86LFAL0gSI2dUxLyDuQH+6Lj/WkEKbJhxGqWh5GcdR40gq8kilkWKPLunQe4T2L+Su
 oHqmcyBKpba/CEf+mbCkQnfTrWhFD3HScqa1X2rYavwXPhrWf+x/NkmtsP4sQl+OPLZTLiuT+8h
 puamHjs+0bDnO0PlIOg==
X-Proofpoint-ORIG-GUID: 4dZwshmX7EYpAVIKgt3nhnng5jg8hyjC
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA4MCBTYWx0ZWRfXzNQAkOr09Asc
 B2D8c9banlBs+pnV+iJVRVlN/Xi7aw0RO4llHqunDt2PfdcgSQuwGWFbOgtBVgqmzv3SFfDx47Z
 2xOtN5B8WuIxtYo7Oy0kNVd+6r9SaHk=
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a705963 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dlF2mmIejKc094u5LhMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030080

Changes in v3:
- Responded to Sashiko and implemented its comments
- Properly handle root node with more than one space "/  {"
- Add more unit tests for DTSO whether properties and nodes are properly
  detected as top-level
- Link to v2: https://patch.msgid.link/20260802-n-dts-style-checker-continued-v2-0-6c5dbd1ccfe4@oss.qualcomm.com

Changes in v2:
- Trailing slash to maintainers path
- New patches:
   - Patch #9: dtc: dt-check-style: Add test for trailing white-space in DTS
   - Patch #10: dtc: dt-check-style: Add warning for redundant white-spaces
- Several fixes based on Sashiko's report (I responded to these on the
  lists)
   - _walk_bodies(): Fix setting up proper parent to each node after
     exiting node parsing. This wasn't working correctly.
   - check_child_name_order(): Properly sort top-level nodes by names,
     even if it comes with unit address like memory@1000
   - Add rest of property_bucket sorting for top-level properties,
     even though no properties are expected there, except few vendor
     ones
   - check_continuation_alignment(): Improve error msg for
     continuned-lines alignment warnings

- Link to v1: https://patch.msgid.link/20260726-n-dts-style-checker-continued-v1-0-b05b8f897670@oss.qualcomm.com

Few improvements and proper handling of top-level node (name, not unit
address sorting) and property (model before compatible) sorting.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      dtc: dt-check-style: Add missing /dts-v1/ to few test cases
      dtc: dt-check-style: Simplify setting depth of DtsLine
      dtc: dt-check-style: Handle root node in overlays
      dtc: dt-check-style: Handle sorting of top-level nodes and properties
      dtc: dt-check-style: Drop stray backslash before quote for continuation-alignment
      dtc: dt-check-style: Fix alignment of values in continued property lines
      dtc: dt-check-style: Consistently call 'kind' as 'file_type'
      dtc: dt-check-style: Introduce 'stricter' mode
      dtc: dt-check-style: Add test for trailing white-space in DTS
      dtc: dt-check-style: Add warning for redundant white-spaces
      MAINTAINERS: dt-bindings: Include dt-check-style in DT binding entry

 MAINTAINERS                                        |   2 +
 scripts/dtc/dt-check-style                         | 210 +++++++++++++++------
 .../dt-style-selftest/bad/dts-child-name-order.dts |   2 +
 .../dts-child-name-order.dtso}                     |  23 ++-
 .../dtc/dt-style-selftest/bad/dts-cont-align.dts   |  23 +++
 .../{good => bad}/dts-digit-node-order.dts         |  15 +-
 .../dts-digit-node-order.dtso}                     |  18 +-
 .../bad/dts-extend-node-child-name-order.dts       |   2 +
 .../bad/dts-extend-node-digit-node-order.dts       |   2 +
 .../dtc/dt-style-selftest/bad/dts-line-length.dts  |  21 +++
 .../dt-style-selftest/bad/dts-property-order.dts   |   7 +-
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 .../bad/dts-redundant-ws-strict.dts                |  27 +++
 ...e-digit-node-order.dts => dts-redundant-ws.dts} |  30 ++-
 .../dtc/dt-style-selftest/bad/dts-trailing-ws.dts  |   8 +
 .../dtc/dt-style-selftest/bad/dts-unused-label.dts |  21 +++
 .../dtc/dt-style-selftest/bad/yaml-cont-align.yaml |   4 +-
 .../bad/yaml-redundant-ws-strict.yaml              |  29 +++
 .../dt-style-selftest/bad/yaml-redundant-ws.yaml   |  29 +++
 .../expected/dts-child-name-order.dts.txt          |   3 +-
 .../expected/dts-child-name-order.dtso.txt         |   3 +
 .../expected/dts-cont-align.dts.txt                |   8 +
 .../expected/dts-digit-node-order.dts.txt          |   2 +
 .../expected/dts-digit-node-order.dtso.txt         |   2 +
 .../dts-extend-node-child-name-order.dts.txt       |   2 +-
 .../dts-extend-node-digit-node-order.dts.txt       |   2 +-
 .../expected/dts-line-length.dts.txt               |   2 +
 .../expected/dts-property-order.dts.txt            |  13 +-
 .../expected/dts-property-order.dtso.txt           |   8 +
 .../expected/dts-redundant-ws-strict.dts.txt       |  13 ++
 .../expected/dts-redundant-ws.dts.txt              |   9 +
 .../expected/dts-trailing-ws.dts.txt               |   2 +
 .../expected/dts-unused-label.dts.txt              |   2 +
 .../expected/yaml-cont-align.yaml.txt              |   3 +-
 .../expected/yaml-redundant-ws-strict.yaml.txt     |   5 +
 .../expected/yaml-redundant-ws.yaml.txt            |   3 +
 .../expected/yaml-value-ws-multiline.yaml.txt      |   1 +
 .../good/dts-child-name-order.dts                  |   2 +
 ...ld-name-order.dts => dts-child-name-order.dtso} |   5 +-
 .../dtc/dt-style-selftest/good/dts-cont-align.dts  |  11 +-
 .../good/dts-digit-node-order.dts                  |   5 +-
 ...it-node-order.dts => dts-digit-node-order.dtso} |   8 +-
 .../good/dts-extend-node-child-name-order.dts      |   2 +
 .../good/dts-extend-node-digit-node-order.dts      |   2 +
 .../dt-style-selftest/good/dts-property-order.dts  |   5 +
 ...-property-order.dts => dts-property-order.dtso} |   8 +-
 scripts/dtc/dt-style-selftest/good/soc.dtsi        |   2 +
 .../{bad => good}/yaml-cont-align.yaml             |   8 +-
 scripts/dtc/dt-style-selftest/run.sh               |   2 +-
 49 files changed, 494 insertions(+), 130 deletions(-)
---
base-commit: 1c8869cfe9534aa9c3179ff0ad36f2b17e1347f5
change-id: 20260726-n-dts-style-checker-continued-b6a05e278891

Best regards,
--  
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

