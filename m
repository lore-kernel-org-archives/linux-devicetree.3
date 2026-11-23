Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444487;
	b=0gei94MRTMn7fy/5vnKGgW1f35VM2stn58r25VWoiknfxY7AkRyYOlcHXzOJW5bEmiob
	 BNbhccan0wLo7Y9xQNKoMtqpEh0S79ZJLCLUujcBwNOU9vS/WhGxlVa5NTPeK73kH2NkV
	 3siQUW+tgtu/hAWBml9YfRxpoUCBBpvenQS2tc4hvcjPVNi3gc8hplRVEeq5zNHvdb2lE
	 KThDm4W9x6FLUHv65B432ieHrG8dH6+wVcb08pxfnw/Vl7+BqHvFlu1h1PSHgj5fFW23z
	 m8HmWp9plFx55UMoX+C6OA6vTzBie5ez487xBH0JPUC+P3zS+o/A61YCNy6Y7WgFnWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444487;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
	b=C71696KhrnpE2QU+cHGFzSMp7nBihbCu9DqYIiiexpMF3jSHEgPlaBhYnlUZEWKz/u/s
	 s7FN9Jw8KPry1+Awl4uBF7OLNhGMIocXTk+SNWEWcwXlR9NWncnjNQrIruy9cRQZFzh3u
	 N6lzUJ0C2+5h12iS8NbA4/iGaw4+ic1901A69s6dK+f5ofCL8qZLWyTxMVHKUuph66+ud
	 MRGddgYo6G4H5I5XLQRb8iZgjdnS4oyN2Lts15OHOdx+VmrZSAvqlAHEhdQ+p25u2xjPR
	 CvXUFhmQwafPseCR07vKUx7MZoMtBA13zl/w1s+hteYtcJQhwCiTXA0Bm7JkG75ciiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="IBdhDM7/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="C3j2/6nH";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A3606A31E
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:34:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C5A3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IBdhDM7/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C3j2/6nH
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKstu2621997
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:34:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=; b=IBdhDM7/3HUZSXDT
	STbqoNJPo9owgso9UilkDQ1JQnpWHbDOcojnxddccFlu8fewo4UUTQCb5yeoLf5C
	eYH36bKEhGSvqXQYmNFDn24gGNkWvr4thE9CrnjSerhEdQjMrmC2ifUyRaj3NAwd
	Fx4UYOo89OlRGkyXhhHw+KjlCUeTb5kBSl4Z4alesXJ5rZ2NCZi0fnniQWRth0TU
	K2PpHRW59IbpFVe4MTwXGnKxurv6P65/tYxVWmQ70jNRfoD0FCLxik6zxMFmRLEL
	0NAQ8FrB/kNcxbs05EPw43SMrL7u53rPzXF/UYaYJ+OE8o0qGS7ijxuuGB9EmKhD
	zYlOgg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9us8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 14:34:45 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67dabc6d5dfso5797648d50.2
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 06:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795444485; x=1796049285; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
        b=C3j2/6nHdZtys2QUDXUO0TSbFjIwSOOANliTHWofJQRWUOcJ8zKb+SXYBZ1ieXjyTi
         0FoTs3QBKBtDS980V7RJIQ12r3l4HI25cHvVNdiFCr3FfjN9S0bqswUeK1RjPvmpp0oH
         aBMthSs2HYmswSyPDdYv0mf0A2i0xr78+cJvDBlyk3iw2GAcp904Kef4IOJmuOgoSXPC
         YJj5G27TmvzPwZ1CrPjz2qvZ/VTGjCMNGAukaaE9eOzZXIBvzZ108y68EpQLaZpJXukw
         BCY2W97hM28VCbBcSABWoU4CR/yOXLuyXz3vPAT8xY5TIGcXBhbnorRIxEIVHbqQC6Hl
         ralw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795444485; x=1796049285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+cXoVZT5d2t7hV9dyq4hvfu5OliGaOGWKLJaU5R7SA=;
        b=qQrLEONb2Mrg3YKkt7XNKEA1kcq4B0HjVPEqUximzYpOWdxWzK2v8HjUhFEr7rTQdk
         NQh4rEGIwAqHpPBN35tSkjoymm5XZehzF6ezBgixI9KaJX921wT5W1iYc3Us1I6x0Jus
         tsTzBUAiGkL94rsJQhdDNY36WFGGKUwsRZCw5vbWFMnvpSt8DSawJULwMhXHdNsFOEVI
         1OL+70vP9Dcd/frFYwQtSW+X0JrF78suq53eixOR5uUqkW6mmgoIHratpMyefzrlBnz1
         INaIzzW7mavT3tgzMG8NzUOYRj/iaHXikKdo13edJZ11QOmX3xjYHVMbuKDkMfQ0iWLD
         LMww==
X-Forwarded-Encrypted: i=1; AL+hErGZY0m4+HRdF5abQ07vI4KkC7+2P6FUQpDaGHHsFPf4qvd5nx/jwtNOQaXIF/G2R9E8rVtVuEd/TlUB@vger.kernel.org
X-Gm-Message-State: APuU4Z/39Xa2dPte+PsWnF3Rq25ITPnHRyUv85rNYvBoC1p2l4ARqVlv
	GaJRC0XlwloK/OYQzck582RwK4hvxNN0hNegN5TeSvNAoD6Vok7V6Rxodl0f8lFIXlLrEGC1iHI
	HFBKDsP8rPNMyEy7pQ7izz2tIeA/DfthyZjrqQ1lleb8wQglyfReQQKFck5B0nd4s
X-Gm-Gg: AZFdTZe17GV4JKB5kURkerJVgZWO0KZO+z5lEXOUekgvPjV00iHQ5mjYOPVIqDPMD0D
	iNOtbJiGs1lwL1wBlFt2cSJtqX0ylhYV+JJNoQjyhYMExhRWfvf+7X67br0Q9IXbzzHkR1XEgEh
	IKLsYYnWH5Hzsn5Pqrl+xouwVowI++iB++jPs4cqZDIkrkw9YaY+Jh3i8ZDeOSahOMSqY+NzkHf
	31WIFXOvg30T+wYPZWlLsjq4GllUZ4+LITLybeui7dSmSyz1RyZaxaYPnrVyLPMROA8uQF++DZK
	3w7iNslhDGTOvvx15ete7c5OekDAJeR/ggmPxUt/J9nvSYLLhIez/forjIbaL59oxShJhjl52f8
	Ab8IUr2OvBc0qlifHfWf+aGg1D+iLl0NPCfqpgr3yQ+xB29C2FWA/lxkl8CB5o0qQ2nHs0mckUq
	ltt0j1rUmMm0S4bJXYjCrKJGfOeyPRT+4ORO4/K31spUCdih1XBovvj+MmKNIgOw==
X-Received: by 2002:a05:690e:1c1c:b0:67c:1dca:7e0 with SMTP id 956f58d0204a3-67e03cff709mr2905892d50.14.1795444484791;
        Mon, 23 Nov 2026 06:34:44 -0800 (PST)
X-Received: by 2002:a05:690e:1c1c:b0:67c:1dca:7e0 with SMTP id 956f58d0204a3-67e03cff709mr2905869d50.14.1795444484149;
        Mon, 23 Nov 2026 06:34:44 -0800 (PST)
Received: from brgl-qcom.home (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26263469f8f.21.2026.11.23.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:34:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Lijuan Gao <quic_lijuang@quicinc.com>,
        Melody Olvera <quic_molvera@quicinc.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, netdev@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH 00/18] pinctrl: qcom: add gp_mn mux function across Qualcomm TLMM blocks
Date: Mon, 23 Nov 2026 15:34:40 +0100
Message-ID: <179544447632.77146.14884722918215310109.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
References: <20261118-gp_mn_tlmm_support-v1-0-703f7badd194@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: QT2siGvROx9cdKLLeZbDPFITZnLtRStA
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b044f05 cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gHIesgCGEubIfZZWx2YA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX6bPjXQbizbI5
 LCoB9dFG7PVolppk30dqUKMoaqfAiRsHvaJXWBxWi4/be6piC90qfH1Oqkbr0n9XHqVMDz9cHPE
 WqFo79KO8PoAo1m+zRWEsNIzz5XzofQ=
X-Proofpoint-ORIG-GUID: QT2siGvROx9cdKLLeZbDPFITZnLtRStA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NyBTYWx0ZWRfX7vv2dv5r245Y
 6S/l1fwH2cguMujEf9UzgLm974LV3DV4QcnwIpieQ3ybnA0tARBqCE9NgMd13oH2IqiGEK8hCvv
 KhHNX6/15tdCehj6rl15OdRtfY7dCDkha7etqwVgLAteIIcPXvh75UYmZwXla1B8vdEnOGIlqTN
 0/xMuocJaCdwz2TbAoKjR2bM9Y1Z4aQYpOUShIZ0ep0QJyid+qFGV44etM/6Ilk+9re6KysJI4D
 fG4rMbAz1aRXpHDfRm9Qn1Ov/hRchnT6eYdpjjYdAN8gYapYFrmDAkgNLh4ENEx2qBlzDRcEc90
 kqGIKxh0nd/5ve3OFjoBkiE1WZIX3KshWFuWJtvslQwxaHTb9R4MRuyCm5cfZ1mG5QAgrHtsk5x
 oGBbnkF2WK+QmMeUcMwfNkg9CBtwuMZEWkIsivk2hNMZDNni/DhvOhCXxGFaY/oR09vB7P9l0gZ
 Ziqs6yWOVO5RU/H+TqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230057


On Wed, 18 Nov 2026 11:32:31 +0530, Taniya Das wrote:
> The GP M/N divider generates a clock output that can be routed to a TLMM
> pin via the gp_mn pinmux function. This series adds the gp_mn function to
> the Qualcomm TLMM pin control drivers that expose it.
> 
> The driver changes for QCS8300, SA8775P, SC7280 and QCS615 were originally
> part of the PDM GP_MN clock series, where only the drivers were posted.
> This series adds the matching gp_mn entry to each of those TLMM bindings as
> well, so the binding and driver stay self-consistent. The remaining patches
> extend the same gp_mn function to additional Qualcomm SoCs: SM8750,
> Kaanapali, Glymur, Shikra and Nord. For every SoC the gp_mn entry is added
> to its TLMM binding enum first, followed by the driver change.
> 
> [...]

Applied, thanks!

[01/18] dt-bindings: pinctrl: qcom: qcs8300: add gp_mn function
        https://git.kernel.org/brgl/c/98215755f97c9442690d7006390a6dd4fafe2496
[02/18] pinctrl: qcom: qcs8300: Add gp_mn mux function
        https://git.kernel.org/brgl/c/d44c2eca9f49c89e566368dc38aacb1cb0c2b1b8
[03/18] dt-bindings: pinctrl: qcom: sa8775p: add gp_mn function
        https://git.kernel.org/brgl/c/942cc68b11c1a99e0cd0722934135bc0585f2352
[04/18] pinctrl: qcom: sa8775p: Add gp_mn mux function
        https://git.kernel.org/brgl/c/04a448e013117a53f138464a3adc3454407e21cf
[05/18] dt-bindings: pinctrl: qcom: sc7280: add gp_mn function
        https://git.kernel.org/brgl/c/4b6560893c646794835fdd89643e9c71fd0ea870
[06/18] pinctrl: qcom: sc7280: Add gp_mn mux function
        https://git.kernel.org/brgl/c/dbb4b922fd5e5f6f3bb8b6ecf1d48aa73445f98c
[07/18] dt-bindings: pinctrl: qcom: qcs615: add gp_mn function
        https://git.kernel.org/brgl/c/0d3cf110ffdb691742c3659508d5023f15d509fb
[08/18] pinctrl: qcom: qcs615: Add gp_mn mux function
        https://git.kernel.org/brgl/c/5308e218e3c2cbf9cfafce322b3bdfbd71b258da
[09/18] dt-bindings: pinctrl: qcom: sm8750: add gp_mn function
        https://git.kernel.org/brgl/c/0cb5ffa9eb0ce97db86106d298d2b39d55680c81
[10/18] pinctrl: qcom: sm8750: Add gp_mn mux function
        https://git.kernel.org/brgl/c/c24a092390a21ecb61ec8171b41fa289d27418e9
[11/18] dt-bindings: pinctrl: qcom: kaanapali: add gp_mn function
        https://git.kernel.org/brgl/c/d804723bcfda3f2b30618aec18eb1cc0881ea13b
[12/18] pinctrl: qcom: kaanapali: Add gp_mn mux function
        https://git.kernel.org/brgl/c/dd9ecba27b981279e2cc84a225a11c7c6308ea76
[13/18] dt-bindings: pinctrl: qcom: glymur: add gp_mn function
        https://git.kernel.org/brgl/c/844b5b901910df4718171519fb1393e2bea57bac
[14/18] pinctrl: qcom: glymur: Add gp_mn mux function
        https://git.kernel.org/brgl/c/b1922656379ea475bfc5c0f21f615c4eddcd0226
[15/18] dt-bindings: pinctrl: qcom: shikra: add gp_mn function
        https://git.kernel.org/brgl/c/36303ea598135dfbe30c77773af509ba32542795
[16/18] pinctrl: qcom: shikra: Add gp_mn mux function
        https://git.kernel.org/brgl/c/c16f39dad1bbb9dc10886de1b113695166d60bb9
[17/18] dt-bindings: pinctrl: qcom: nord: add gp_mn function
        https://git.kernel.org/brgl/c/0a9a2a463910ba341fc12adf362227f730de7aff
[18/18] pinctrl: qcom: nord: Add gp_mn mux function
        https://git.kernel.org/brgl/c/e19e48b2e6c603ebd4839153a45294a9c416e083

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
