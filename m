Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA5143B3FF
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785312197; cv=none; b=oHeUS/H2wVGoItCny1TVlKTL0gwtTr9F+KnDxATSmEIotdpWTT6byU3sQYja/LB7pB1fK2/RqZpipZDH+CDr7ujY6LrH8mSLa0rWeGRojfP5+XOsRzetmtaqXyQHe6sztLOTZ2Z6HSrbc22wwalVvqxV8qaytgFdAdRh2kLvIwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785312197; c=relaxed/simple;
	bh=VIXH/4wp7GDGEjcN/n0qLhwMWfSkC161PQaJIB1mta0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3bHO6p+3Eqqh3hAmIYRynB955j6WKLUY4XcaaP2PGk7xTI1RStKMkg3yHSRKMW4X0cnN6MCPEme5ch372AN2mzXCEtXjW/EVPdqkhyWqq2QuSGE+Ccw4q9YJ2YK1eJeaEpJpmeNROLOrfPuAkd0mlakST7U98qBYIuGLLVYL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYQ+Wll5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XowlwIL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYQ+Wll5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XowlwIL6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7fIbS1182038
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:03:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5lBdzh8bRoeR8HuofUs5c1Q1
	lfWDYRIe765m7EVTOgI=; b=DYQ+Wll5//7/3bfEluNlFT0s8RNE1i2CWf/EqOTF
	JxOoPGqLAWPz4vkAFOPqHavzKLZb7EZBL4fFhjQgzHVDAcwKft7c3gQYWzVAXbQU
	+y/yVbstWDdGviq+ITbmwCVyhl7BXKzIA6MucRYLD1EXzkCvc3lgjQ6mw67sdNk0
	490Oiv4DSDGWs7YUW641jFQeIxEPtEaZf1GNj/n93YGkScmOmDfvA/V32UUI4XUQ
	4b22hk0BRvIU4uz9BIRnstxnsEto+mLX14FaUf+HFDwMIYaB9BiTywPV40iUAh14
	e+P7Umxp2YKlybDralLgO71es+oUTwuu6cB+GoBhzg6kUA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmcrhph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:03:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84c4cd31b51so2201960b3a.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 01:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785312188; x=1785916988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5lBdzh8bRoeR8HuofUs5c1Q1lfWDYRIe765m7EVTOgI=;
        b=XowlwIL6TLJ4N9RW2RzfFlPASbqFISOou7A3RTzLatUjL//ATJFKs56DPIVMCBWnzU
         tI+OyeQ1VH6OICH+xXbpFqwwVmA0mPW3+6028jJHKyALXkoG/A0QkkQTJ55FCzjSFWjn
         TKvzDOzYjkeEgd0zVTvhUn2nAN5E32zd1Yc5iRVi6IGBcQXX8bX2KjyLCmr/d+F1t9Ih
         hV/l73dpNzYIC8Q1vqpvSO4Sq4u47XKfTIOaN1vqEyteGDl3Yyn0qctXn+IxwdVsRrXR
         OyqouGibawpwnFcV0gMZvRaQgZI53t8u/d7TuM2RCPIqftZ6UhoMMvqHbdI6atu7lA8a
         l7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785312188; x=1785916988;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5lBdzh8bRoeR8HuofUs5c1Q1lfWDYRIe765m7EVTOgI=;
        b=pLvWBcJ73Ov7WDC5qPFv1ds4dpGlHNTc1r42aZdtocIvArZ7OU/sYljFCwA7yrqIOQ
         giuhtwxKAckQglaZAGTG7zByzdBS9FbXlGzgX5RpOHVbQR2hPXGaedd2r5akINO6qUL0
         +jhxCif8HAlGuq32YvZtOCVTkEEAXxacLeTAJLWmE6kIODMoACYoykVJuT9SH0iniyz7
         PEDN3IEJZbgETSYAqTeEIL4uX01Lw3pePVmM+Jdk7woo1ax0DgODzsnXzmXa7pzIrKQt
         GUBT041akOZtx8dDyNBAwh5/iD0qG1yxQJJuoYt9j156Ap0qT9VIsxbAwqy31qE9I6mZ
         5OIw==
X-Forwarded-Encrypted: i=1; AHgh+Rqff/d/NcOyDtj84XbQyqFd3/Uv9QKR3wTR0zf3GG2XIOtCltzkX/5e+f48t2DXcGpYenMFM8S2QvNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3vGrmoTsUKtZgeTRhkOOvJ3O9+nq053DBmqfnaTSP8meGWI+9
	vgExnPSQUlqrJLPmH7Zz09UPIAYj4f0005EsgDNTXjglpnuG6AiGGVrRXZE1Vc+wL2SuEDjzPs7
	bS+pTkVTxJPm3yUmXtI/BKsU3RIn+AL+ZfB4RghrvYf7AokdkHPnyYYFdNAfNK5O7G9nQfVxs
X-Gm-Gg: AR+sD13Vfl9vFJ5reB4+geivvAnF9FGH0uadW22WjQZWl5obYkGMlxJn/KJjaoGOx9K
	NGsa6WL1e0x2mx/2iHcMGS1QGvO9bolUK/2L3SSVKQkURrIhOs+/JOjA23bF0dXLm40ne9LC7d+
	+7M2uLjvEnZ0D5ME+HKSdSInuay55VP0LraotZ6RLwXbRtwu14v76leu5i0I9he/42glZXefvfB
	d0iOX/GSTjPqdGfU1RCiJlAakorvsKQxj85l5/lImHqZBKDaHxOjzv5Jy1SaAxdVqUNvH52ZWVT
	SnHRxF/0mlz9oqXkiN0APlaiAq2pP+ZcxZO/uSAOlzU06+/CAvin7ftaS2nuHy/Afz876sOkBQt
	ivGNb3g3agLdXLA6FW4VAMVGapQLrNDssq+J9c8tv6ukWDlA=
X-Received: by 2002:aa7:8c18:0:b0:848:7bcf:9a9a with SMTP id d2e1a72fcca58-84ea7949e47mr1014504b3a.1.1785312188102;
        Wed, 29 Jul 2026 01:03:08 -0700 (PDT)
X-Received: by 2002:aa7:8c18:0:b0:848:7bcf:9a9a with SMTP id d2e1a72fcca58-84ea7949e47mr1014478b3a.1.1785312187664;
        Wed, 29 Jul 2026 01:03:07 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea03d3182sm965815b3a.54.2026.07.29.01.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:03:07 -0700 (PDT)
Date: Wed, 29 Jul 2026 01:03:05 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to own
 binding
Message-ID: <ammzueQdjCXTOMUH@hu-qianyu-lv.qualcomm.com>
References: <20260714-hamoa_tcsr_qref_0714_2-v1-0-13047922a376@oss.qualcomm.com>
 <20260714-hamoa_tcsr_qref_0714_2-v1-1-13047922a376@oss.qualcomm.com>
 <20260721-tactful-cerulean-shrew-120a9c@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-tactful-cerulean-shrew-120a9c@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX/ytqjibBskzK
 40OEiulKaS252pyF466V3j/Iqh/fMNqBn4aZCZ7cBn76VPDGvcoARzr5Dh8ylblFLWK8Sbj4MSs
 VCO3O2BuEwJhsuwZ4y83L/G8PL4WBlGOZzJCsMmOocLz0hbrQa1yKGVXPCbSdDXpqMhyJ1lBPj8
 1FuiYH0roEAHv0SWc4zJOUENM0fCiWEsxrHV6BNgsw2YDebLj+RC4tHD4Ws58hdGd+VDgZNv7xD
 hCDhBo7zxuq68ZuG9eJ5B9JEqL+EBpofc5+fo0VmU+MB5ONEkFu4hgavJweDARs0l0nOZJ3SU8L
 iJfKo3iZ0vLHI6HIJjZidTiullw2xD1KUob1hRKKgUk7eLD5ibVAlogLzI0soaKlJvuMKspofgq
 c3SbPIR1a3yG9EP4GUHYam1H1WgXbGOSE/ulWhbhQTy1Hpj502VYKblulI+rtBneuAhXvgoX47T
 DGBzjrHux2YZjkOuMTA==
X-Authority-Analysis: v=2.4 cv=HP3z0Itv c=1 sm=1 tr=0 ts=6a69b3bd cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=u6tME7obI1wO0-EO1nUA:9 a=CjuIK1q_8ugA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 66xm3IBCPn5UeLV9NNxIPwvyDfuCxgxk
X-Proofpoint-ORIG-GUID: 66xm3IBCPn5UeLV9NNxIPwvyDfuCxgxk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA2NCBTYWx0ZWRfX1sriale5WPMB
 whmHapl5hNtrf1pot41SxSktzHMtMYpKAHh0789OyCHi2ipgEqsbuzGzQ9D3TQ21Ehew7BpnpEj
 mv58objNZlxdlgFgUnAiwmBnkv74zcU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290064

On Tue, Jul 21, 2026 at 11:52:52AM +0200, Krzysztof Kozlowski wrote:
> On Tue, Jul 14, 2026 at 07:40:41PM -0700, Qiang Yu wrote:
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - vdda-qrefrpt0-0p9-supply
> > +  - vdda-qrefrpt1-0p9-supply
> > +  - vdda-qrefrpt2-0p9-supply
> > +  - vdda-qrefrpt3-0p9-supply
> > +  - vdda-qrefrpt4-0p9-supply
> > +  - vdda-qrefrx0-0p9-supply
> > +  - vdda-qrefrx1-0p9-supply
> > +  - vdda-qrefrx2-0p9-supply
> > +  - vdda-qrefrx3-0p9-supply
> > +  - vdda-qrefrx4-0p9-supply
> > +  - vdda-qreftx0-0p9-supply
> > +  - vdda-qreftx0-1p2-supply
> > +  - vdda-qreftx1-0p9-supply
> > +  - vdda-qreftx1-1p2-supply
> > +  - vdda-refgen0-0p9-supply
> > +  - vdda-refgen0-1p2-supply
> > +  - vdda-refgen2-0p9-supply
> > +  - vdda-refgen2-1p2-supply
> 
> This looks like ABI break without any explanation.

Okay, will add below description in commit msg.

These LDOs are required by QREF to provide a stable reference clock, 
otherwise the USB/PCIe/eDP PHYs cannot work properly.

- Qiang Yu
> The dependency here makes it also non-testable by toolset.
