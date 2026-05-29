Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBCC3AA4F3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780038360; cv=none; b=dAPjP0bgRxHT5OxCqm6lEInUZXkTOD/qDmErZ5yxiE6xpi+pqatsCfcTnIB9rQiPfTEm3CJV9icSC7uSTDOYrdf6P5dh4Hs0Qv648AN1H4yCz0F5dlwBOa8TbOJ5bwlvTGudhlA1n671r+djHIi2hLFXk3FQMn/ga/sJprlBGR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780038360; c=relaxed/simple;
	bh=2PAalM6kKnFYU06xQ410VdOXAbMQi4bwcAFMRjokBhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vFeexb2271QJAEkX5EZ6L9bC/ABwr/Fozv6xQN6h10RNxG6xag+mQV56rsENEi93lAGzK6DVCzKfvXWKo1aoftRjivRBL0wx4WmpDyjvhfMqZoi2pKhesOTrp/HXzzxUnkD9QXIK6Xs+A4yjDBs/NSusr12mKJR4B6A8Kdg6vsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KnDSv3kV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jk6XU5I0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KnDSv3kV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jk6XU5I0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T6MUIw1931862
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uggOyLdQd0AYcPA6LkUyUkRX
	QuNDy/j4iSP3iw0FYuY=; b=KnDSv3kVDKGz+GjdoSGlAYotV3tjaBLTK3MzYMLn
	kdp026GxURdxXe89mw60cWHYa2lQYJyY5N6Qq6ulJ1+vrf4F1cK3sR13jvf/h1Pn
	O5xf6eZbMzUE+yInZpDuAUyvAuyJFCzmhDgZq5mi9fIQ7EDYXjaqrdaNsXUlNava
	7uLINZAKzuL5uYBDYoXPlFEZgPV+3dQ71Q1+Ekeqjebewt8zZHZfIrTEBG7Ruwxq
	NGZfoUHZaDDzyIkjdbISEh/C4Zj6ISwKkIni3k+Dqz0IRTTi6ASInuM2yw8T4w1g
	9P0xlHEIsdguTxiUw7+MBuioZA3oauMxtIleSRQoZMLoeA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eesxab516-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:05:56 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so3638345eec.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 00:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780038356; x=1780643156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uggOyLdQd0AYcPA6LkUyUkRXQuNDy/j4iSP3iw0FYuY=;
        b=Jk6XU5I06hKOzEaJU7HG8GcXWaPxji/t2D5FGa29xWE6JU+frqEZTFqHzsVjZLFvwx
         l9FI+IKITTI/seO3g/mk57y40nzI64udwJlc0e2X6RICM+rfdcmzFen7CezqvJOtg0ub
         qSGp//JlAmabCbjkmjrVG429fRWsBoCoEEvSo+KYkmoUmuPhnBP7HySGKKIcTpYsam31
         LRpnwn072uy8XO/BEWXPpv8/TuyElksqfQoL8oRftQVWmyG0V+pCIzdF6Ws3Jh18fLuu
         lq9OGmJ6cp+0kgYnSG/zIzctTJMeKTzQ5JX1oEOCHeAslcF4hKkpsFJt1scO6pSoFCqG
         7KSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780038356; x=1780643156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uggOyLdQd0AYcPA6LkUyUkRXQuNDy/j4iSP3iw0FYuY=;
        b=TRC5eahC+FCpXMXHkwsO8Jdjc+2tlxSMkTRiiV/HAha2ztdpep2bIH16MCN4O/kpOI
         R+z6Z1s2ktZKJJVb0taUibu/oPBno2SiNkZgDnf96FXShw0XiVPYW57+YptCd0vHusFW
         tpeefb/pmkymwkc06zISgsIF+pfWBqE2uCuwEeuq/m1r9Q7r1D4B7nCaMspT0mN3mQga
         GbDzoWk5E1RuanUL+s19Ud1bfhAuxf6mCa8HMdgSfTrtRPDbl/KCmxtm4cFYAgE/LmNb
         JqooVBJB21leMNeI3tUlokLGmwo1EU0FNfvPm2R1EqdUrkLgcXucLVxhA6Q6VqOQIW6y
         x3lw==
X-Forwarded-Encrypted: i=1; AFNElJ8LIOSDRJt3R/Ma3eZdQ3zdH505rXpxxyspnLY9MhI9PCuAugg7jUEg6CoB9Bp2RtuDMu3P9I0eOZqo@vger.kernel.org
X-Gm-Message-State: AOJu0YwIDO4InLi+LCEqWSKiiX07QTOy0f6tHiwmqoQ3ktHkB5o+5VgZ
	EMlCFRigmtsCTMj2LWzkwKlTfIzOptyzpuCVFFlFhYLAQDhuEvHTwQ96RIsnEq8OpPynOJvIgrF
	JqH+ztSwt6wTowXgrDLGV2Wawd2otyqjNlg/r/HJZF9VHY0ValYE6DF1XvpFtoTm0
X-Gm-Gg: Acq92OFe2rwrFOLNHZl2REig+5pEbO22zA7Xlxhm/XZduj+9Tnqg9fhM+vHWhZcijbK
	PX2qACn85weo/Ls+23GffII6OUfYhuitlCe6JxdOZGeIjWXQ9mAJGOqOf8cM4Q6SUqfFF6Y0HNM
	oSsxjJuq6ZuXJ0G7Y3FBh4OatetC0UNXAsVLjEj8EJP+xrAxKwlkKuAM2Gn3y/BnARFXoRZzi9V
	x1iqtSjGwhwProXnY2v0t5aU2a4bSRMHR0A6iuky6mSSv6yDdhpz3s5Nex6OY3LxhvXHb6b5hrw
	SHekz0Lq9wrtHFMLzDGlBHoKbkRJqD3uM/DcnfOd6ZCK8Kj7Qne4HrOTdD0MxibYRMGsjxBS55y
	4zaSlfuEOoyb+X0C9c2QZSCCsmNzMMxuKJR2zZmo1X6cciVnQeMgzM70CqafMP8NqZA04/BoBVb
	aTO58=
X-Received: by 2002:a05:7301:fa04:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-304eb0c567cmr819261eec.10.1780038355904;
        Fri, 29 May 2026 00:05:55 -0700 (PDT)
X-Received: by 2002:a05:7301:fa04:b0:2e2:4979:eb5 with SMTP id 5a478bee46e88-304eb0c567cmr819240eec.10.1780038355258;
        Fri, 29 May 2026 00:05:55 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed30fffesm746891eec.11.2026.05.29.00.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 00:05:54 -0700 (PDT)
Date: Fri, 29 May 2026 00:05:52 -0700
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
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom,sm8550-tcsr: Add
 QREF/REFGEN supply properties for glymur and mahua
Message-ID: <ahk60MkNDYOgU55F@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-1-ded83866c9d9@oss.qualcomm.com>
 <20260528-adamant-termite-of-drizzle-0c39de@quoll>
 <ahg04dmgSWPuA4Tk@hu-qianyu-lv.qualcomm.com>
 <79515bd5-a1c8-4317-bd15-71569f43e522@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79515bd5-a1c8-4317-bd15-71569f43e522@kernel.org>
X-Proofpoint-GUID: MvSBpSXVyqtYmp_Lg6rN2j2r2RaAAKbv
X-Proofpoint-ORIG-GUID: MvSBpSXVyqtYmp_Lg6rN2j2r2RaAAKbv
X-Authority-Analysis: v=2.4 cv=ZdIt8MVA c=1 sm=1 tr=0 ts=6a193ad4 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=55C5z8EV8FhS1RBCIaIA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2NiBTYWx0ZWRfXxFwzdBwGHuiA
 XjLDunFCGUNcBMnJqjvV36LZSGcegir56f9y4XWfbXAVtvI/ztAME4phRiXb5viy9bTyVVY4uLj
 liS2w2rg+eXrsP1k3VQ6g6zXm1M2eIxwlUzqUIMJkrScOjFvNJk8/psy4G8FP1CFtK0W+FjEulV
 d0R/xQYo3zyRq5CNCqXTPD6NMjm1eGVrYgprDuCF9recegwXj4tl8JrcLugZCb5Y/pdOoEnr93Q
 EW+rdO/tww41PY7uFNHXi8ESjoCiBwwu+6iV3qPLM3C8X3ieCjB5/Z0q8SVezct/PUj+s989Dq2
 aOUOEjwgVKWkuzszX5IVteH5bx4tHTxUrk2CmDK0qns779L6YWblEscCen4wpSnBnrhk7OHfVVr
 moIMg/0TyJUqWBm3NE23vXi6CXxea7jJ8DIlw5gQQCRvp+N2qgFgJJYIm/RL1U+d5PunGpVj57R
 d6ddwz53EL1RuRuEv3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290066

On Thu, May 28, 2026 at 02:34:14PM +0200, Krzysztof Kozlowski wrote:
> On 28/05/2026 14:28, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 09:57:10AM +0200, Krzysztof Kozlowski wrote:
> >> On Wed, May 27, 2026 at 07:29:12PM -0700, Qiang Yu wrote:
> >>> The QREF block supplies reference clocks to PCIe PHYs and requires
> >>> dedicated LDO supplies to operate. The digital control interface for
> >>> QREF (clkref_en registers) resides in TCSR on glymur and mahua. Since
> >>> QREF has no dedicated DT node of its own, these supply properties are
> >>> placed in the TCSR node which acts as the control interface for QREF.
> >>>
> >>> Document the supply properties for qcom,glymur-tcsr and qcom,mahua-tcsr.
> >>> Both SoCs share the same QREF TX/RPT/RX component naming, but differ in
> >>> topology:
> >>>
> >>> Glymur has two independent QREF blocks fed by REFGEN3 and REFGEN4. Mahua
> >>> has a single QREF block fed by REFGEN3 only.
> >>>
> >>> Mark the relevant supplies as required per compatible using allOf/if/then
> >>> conditionals.
> >>
> >> I don't think you implemented my last comments. You need own binding
> >> file.
> >>
> > 
> > Thanks. Do you mean qcom,glymur-tcsr and qcom,mahua-tcsr should be moved
> > out of qcom,sm8550-tcsr.yaml into their own binding file, e.g.
> 
> Yes.
> 
> > qcom,glymur-tcsr.yaml? Can I use a single file for Glymur and Mahua?
> 
> Single file should be fine.
>

Okay, will create a binding file for glymur and mahua in next version.

- Qiang Yu
> 
> Best regards,
> Krzysztof
