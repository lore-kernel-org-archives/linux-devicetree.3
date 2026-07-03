Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226F235E1AD
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068094; cv=pass; b=oIhJNR2Q5lriIf/ixSRAN1O0x2AZQKVTg2gfZ0dCPQoQnqodCI6RIh9tvamukBU8AkAqmT39fEBhWT8vwp69FvpBm5kvW0MR70CFYWB7lDspYBxBqPcUBBe3JhjlfSBI6cfEvCLqb6OVIyj7YdheMU9wtlEoUw68PITda2pURsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068094; c=relaxed/simple;
	bh=A24/IDMt0yFcSCd3f2pMjBY2SE2mBp+L+hitnBhNtNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODSldf4T6ehm3AvKv289nDkcY2CTrJJq/2nwjmjWhB7r3u8tpjHpWpYAMu4g3iP8v0eOjfb30RsPKOHUcO0cFmD4HCj5SBp1eD02cCP2ujGXjnAjoUuMCxxWlF2sZIXxkp2/qHQ+4IJm4CI4Q1ifI/bES0sotvrHlhtU+2Qx0oY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdcfxvmx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PXAuTFe4; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdcfxvmx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PXAuTFe4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rjV23108906
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:41:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=; b=cdcfxvmxsBih+A/j
	fvtwurcdg/gJYSyu5Uig5Gq8wCquo8jNytqD0uu9juFEOtQSfXwjZjtxdQrrTK+s
	M1rWwC22btRXLZcoCOv6/JNy7ImMEvu6mU7onpE62ujvdfACdBmudXFKzXSKk0H3
	SRGOYvTginR0FO2EcdZBohFlBq0WCl7hXURvzCfC05PT+3yBMkMSZ1ylo6orLhcJ
	58m2OMcgctIMwGlXT68/VUkLd9dYqAk7+52jct0dOMaEj7SLsyVye4xcu8vTLW4U
	lCFoR5+AaxXvqlXDqntxmIUnNPAiC8eByWfbz3AwQmww8JOSrqIxfs+yMHpQLRlu
	hpuaWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eya5k4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:41:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so35498585a.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783068090; cv=none;
        d=google.com; s=arc-20260327;
        b=cCyp6rDWTbgYhfCVUszJLjIYcxu8ztmhCNh0J5LQz3Ac5aTYMi6W4MwOKti7oqoafx
         7VcMCpInCweCUvNaQDHUZkNxrLh3+SvzkhfL7MfHIJXygc70vqj51R8zrHTGVSs+VlwC
         QL5eEpdA82j/rz0kUESL+WxgZet0RLRJSU03v4SUouq0+HVvl8LP7Su/rj3CTESezBLm
         L5krT5Ugwpk2Od3mAXU95DHbabwYqBp9lAuMNWdoRuWNoBVuzGzDUJUMV8B2VnCO6kQf
         o/hkiSOr4sm4GoED4ayH/xXPySVXTJhC3toQDCCB6yDtnhFN+8QJS+05m7C3UDTIevUp
         YD+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=;
        fh=1qhrjbvSREjBGG4naXNDqop6+zxn9pMQoBd6PsAdaY8=;
        b=sou3LwCVWAY6dOkS9YjCMH8WjnyqZgk2ZvUBSf2XCpthMGAth/eUhWWSccBqR/yMgr
         RpEjfPluWwbTooCipgu+zaBkY7VDB4UhityFzTMqvrPMv3B7Q48/shaoPNZzhstMwvWT
         SgWyLmE92cpi4EkcpRvAsyRGxjdfWD2lehbFG7p/dZ+iBcirgpmSPX2CXvBJGUfkjrgx
         SWgI7oYcTTbxQCppoME2ZgFAKELOdhka1Fgrp6QhCF6MEij3E7eqohmORpaulfC8mxFA
         GB4mAjIYSbizohl6Cc0fA/PrZNPDT70LudJhb/OSPV2Im8+gSJukViwMjJrZAv4Doyxd
         kL4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783068090; x=1783672890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=;
        b=PXAuTFe4Ojw62j6tAUNP9wnN5lQXZDTel/ZAAICYjrRowiZ5eEmVWyayjZMGqtxl8+
         atLp5BsxEKfO7vxs72gziDQC1lz9G8yVkpKHBUAr/GbDu+tVZmDLNCGV0zrXH/oOq9OG
         jyip9EUMelvPSLjC7CrDNIn3mDEkHKapHvEqiHzzt8nsZeCNURY0CynBJguhLpiveQAP
         Iia7zmCqcD8H9uM1yISwaQLUmWjM+YXk5tnYNqPtb9HiR4hv45//C+ZUdvE3GyUwDleK
         709raCFVUcVRCv8v+l75ETeQ/lBce8WfzSoORZDomGpatyxkXOn7k0g93bzH/8MxKXEb
         dwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068090; x=1783672890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JgfgskfFOJItCCV398c0ggLI02qLuHDQzMpOZ/nUiLQ=;
        b=gETaY1W0UdCtn8170eo4vMy3IclrlCkyS/AkGdBiWINCkjPFhxQbQdyYM15vFKsZ8p
         +pHkiRief3zMZ1kBV/Gl0FnR7Lw17E+LQxLG+c5Wxvt33lbX+Y8Synj52gs0ieFcHZvZ
         FBSOLF/P5j+Ssoy85Osk3dzY0rT8m84qRJuZiOLI0vWGUX2J7ODlj2UDb6JOR9tAhh4r
         +1HpA0TlQzN9PG4WMYIDa7LmnSTF0gfGvHm7H3WdGynBN4jmS6o8Mq/E7RsU9X0Cs9ek
         1NhXBctjZnUeXxUfHeUzrvq8Tinvt5ACI/jfhl8BBo3UBhkYcJdFXnqse2aVFs/rj1wd
         Qo9g==
X-Forwarded-Encrypted: i=1; AFNElJ8oKAI5bv7JzfcDrO6Ki83HjUTqS1YP9Bk3eZlvqLidXLTEVuHxwptmlJf+r1I4Nn1QIfs4fng0xTU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7kVS6fPPlVdOxYYT5jTC05WNXz/GFYDqwCQiYsnBxoMzrscjx
	gW4u1b8Et1WSvWOrlVXeqHbgClYxpzPQMxydFu601IjrwOYDh9zySKaqvzX8MHiF9pTlJl/W1pV
	NhfpoO5IiQtqZmUOMCbMtDo1dMBSy+/LPxL+8yNfcXHAqmtO7yXqRttFDCWStURCqyayrhRJuXF
	aA7yKXM30HtpQ7m5dl3+EM7kEBTguu/4D2tHVFwPY=
X-Gm-Gg: AfdE7ck04if9M5qtXkfQoGEvpbaykKXXrokmrV1LN5quKzBaCSTDtBb04Ub84qo0Til
	96o9SruzGQDjPrBrB/ne1RyTf9aCDALSSdU0/CLL9xidkYRfwsSFNELRsAUtoVouMbYE+cnxIVA
	jYFswnPHMExw2/odg/6FbzahctD2LrkhKnEMqGwXaXh24ZHEkBjhXdDwsyJ20glT7Rcvio5GtTC
	d2TRS4QjYzDRJVlm7FnKaQdmmG4QUWA/o4zs8AL+zpYRvySKoDPcJ6uzDzVF/dLYOLENSlirCna
	MkpD5KiHsA==
X-Received: by 2002:a05:620a:2915:b0:92e:4927:1fff with SMTP id af79cd13be357-92e782c94ddmr1287062085a.36.1783068090235;
        Fri, 03 Jul 2026 01:41:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2915:b0:92e:4927:1fff with SMTP id
 af79cd13be357-92e782c94ddmr1287058985a.36.1783068089796; Fri, 03 Jul 2026
 01:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702-monza-wireless-v2-0-7b56e2a6a6d4@oss.qualcomm.com>
 <20260702-monza-wireless-v2-1-7b56e2a6a6d4@oss.qualcomm.com> <20260703-tricky-hospitable-avocet-dc3fcd@quoll>
In-Reply-To: <20260703-tricky-hospitable-avocet-dc3fcd@quoll>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 10:41:17 +0200
X-Gm-Features: AVVi8CcGrmUi3s72gNEg9Nxjar9xvqGK0gTiAF8t-61zW6VTlFRO9OOYGSuluUs
Message-ID: <CAFEp6-3BptG=S+NutQpvuS2oe+kjJW6N4u0YjVP=T+tbX8PBPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: connector: pcie-m2-e: Add vendor LGA
 connector compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX22QsJ7U4HtRg
 64dNOcFrVqjzGsIjgcx0Yvt5oXH/7EV10UV18ArF4lVajF0fWMvKrwsSwsWF0qyNGUlk1KkAQUR
 lPvAXHTuMKlsOFPU4Hh+CaC5gZUxDkSBc7WKuQ9iOOacxZXWLl1SWQeTsVeFJYBOIDNnw0cQiGV
 3oqt2Gm9p2UI98xrxz9S1yCq4yh4/kE8onAUY4TjDgwZHH5P19ctATyY0OsRv+akAJzmjp5cXr+
 dQtquj7IJj1ijoMCUem7uu9zqMnI5cpdbCgr2oAvCzidNob8AO6/l7L7QqSxK4z9MeqRBfm8I37
 3OCBPrlmdwYhEtTdBzp4DMxB4OKAv0sLVtLwrkeI43sLsTHKCRuagWuMHqq2UQk5/jQYAlbAmqD
 HaZcJg5oxl7DjeuwpzuBrQyPBu7kH330fiVWURsKHQRb7fAXmMKSFNx8mx79iDtr8q5H8VZJSSr
 C/Ut3UfrBeNoVmhfSvw==
X-Proofpoint-GUID: sEo7-2Ez2FhZWv05uazGNr1EHu3ve8IU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX3FjNR1wmECkk
 N2NbVsH+nS3rtuYRMLLj2PRjgEo+FDZ0CKV1Kcp9Z0tSODK60fqpPvPkk1fPMba7J+YCdqaI8DY
 C4PqFvGoYc5A1n2bN8hbznBZqwPSxho=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4775ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=qB6sUIZWhqFJcRNk-TYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: sEo7-2Ez2FhZWv05uazGNr1EHu3ve8IU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030081

On Fri, Jul 3, 2026 at 9:11=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Jul 02, 2026 at 12:46:13PM +0200, Loic Poulain wrote:
> > Some modules (e.g. the Qualcomm QCA2066/QCNFA765) expose the same M.2
> > Key E interface signals but are physically soldered as an LGA package
>
> Why do we need device nodes for soldered connectors? Soldered stuff is
> afixed one, not connectable connector, thus it has no point in DT
> representation.

The LGA module is soldered, yes, but the node here isn't really
modeling a mateable/removable connector, it's the DT description of
the M.2 Key E electrical interface that the module exposes: the
W_DISABLE1 and #/W_DISABLE2# enable signals, the shared PCIe/UART
regulators, and the graph routing PCIe->WiFi and UART->BT. The
pwrseq-pcie-m2 driver and the graph binding rely on exactly this
description to sequence PCIe and UART bring-up, and that's independent
of whether the module is socketed or soldered.

Electrically the QCA2066 LGA on that  part is an M.2 Key E design,
only the physical attachment differs. That's what the vendor-specific
qcom,pcie-m2-1418-lga-connector compatible is meant to capture, the
soldered/LGA variant of that interface. So reusing the connector
binding is a pragmatic way to model and drive it.

It also keeps the enumerable-slot semantics: since M.2 devices are
discovered via PCIe IDs, a board variant with a different chipset
soldered to the same LGA grid would be handled automatically, without
DT changes, exactly as it would be for a physical M.2 slot.

If the concern is purely the "connector" naming for a soldered part, I
can reframe the binding.

Regards,
Loic
