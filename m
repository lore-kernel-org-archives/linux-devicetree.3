Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C053CF217
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782801050; cv=none; b=VO29A+1Fc1m06XnNzL1nKR2j5XtIUQfhgvrDlhS9DS7ZR/MUlXsQ2qVU9muf1U0EW25tOV72ymVX8+yY1OtKC5vtm+bRhLcVktl2zHwKOxbj7Rh24h5CKAL5m0SjU4GKAPbaDUdfmbD+2ZjUBc6DODXYlff2vVp7LXGtTTxmWQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782801050; c=relaxed/simple;
	bh=cKoa/2WFhBW/jlxOH87mkn/Q91gpnRbIKMx3DDYetHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yh1+asMQpBjO5/Tl0Yj5kVW8rUM4LpdheVVsRGiqiFgYnR1yXNQjDALFbcFkRN9Zj8B2JFyjkoMjwuxceOQPwREJsVJYFs/+Th7vd9Zt8b6SUvsCZC9uV6sw/As09HOpnvCW61cQ0SUeDcIUKs0yWuQoPTxnE+6ejygOKdB9420=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S5WbAOQE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W5P7Kj0D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S5WbAOQE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W5P7Kj0D"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CWRd1097921
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fDG5CA7UdEc+XI5+vmHnkILcyd6biWAmZKjpNZyeL/M=; b=S5WbAOQE4T6UsIcV
	wSz1fx0axkD+A1HvQDQeW1oFDBuMkRlXoCIEOE8FS/MksvESP8bSV/GRDQWfNIXZ
	m+KFkUfoQmCKiGoAymup2d+9bJkrVMQt6f4n+o8omVHATK9Opg5rLm91wsBpp/TK
	9rpEmsf7ZVQyhfz7UflwtGJmoZ5Q4ktI7AOaltEk7gXwBkLMXNsBnFghHohuwuVa
	eNJ1W5hYUHUdUnwXcLNk6C47On+x6+b31Zkb0a1abuEtm8BANMUAPGSQkKt/P48c
	CQrqxfyRJuqclU6oFHNb96nm+FD4r+AjpQM6GoFaP5u+n9vYhbKANcrvV1+Qm2Jk
	xhv7gQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1ct6xk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 06:30:47 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca81e05bfso4255840eec.1
        for <devicetree@vger.kernel.org>; Mon, 29 Jun 2026 23:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782801046; x=1783405846; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fDG5CA7UdEc+XI5+vmHnkILcyd6biWAmZKjpNZyeL/M=;
        b=W5P7Kj0Dsmx69yMWgx/jp5ILIzSw7noMKBzTh69JoIOT09BgkRH3WyoSxu2EuAb3Hj
         Txu0AzAKp8vBCtmlF+a+IXqV839Z1hMsFZmBlunBN/6emk91I0n2UDxR6LDXnODnFUdO
         M2GiPLE4L0Kee8O64IPg93nljnchmu0G8OD6PI6yqk894tRkSvd6SeVyEpwFCkT17Qu6
         B56udAFk9be2ZbkrHs7FyW4A9qv+dC6IaiJULqdrhqyCbWoyt0Ibgy+XfkxVY9O1zOTy
         G9qdXLzyVr6P8Bt3fImO+5PcEka2Ly0SmeMzpyZAvPVY9BHOnhDRiYVuUqVb6IKXkM1J
         cW/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782801046; x=1783405846;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDG5CA7UdEc+XI5+vmHnkILcyd6biWAmZKjpNZyeL/M=;
        b=NK56VRvfXZnc5zrYhgTqdL0L+9cN+jtYwNqdsFIOo9sXlEkAAayS2pgH16wLW4SkeT
         +43pfU/u0YJqNk8Y3qR0Jtp2ocqfyth51eOyd3gditkK2C3c0xtVQino++qa0OVc4cFZ
         7lhfhxygE/ZTQumhafon1ALtq1Fce9Xk3Pko/cXw0thu4hXnxEYkFcpO8UdimwS5Bv5b
         r0/SnsXyjbHy1fcyqupjPW03Mj1cFatrRBOVbKzVE5M3O63ZJNa5oRfosZs94takawkp
         pkKmtngiPGyS4v5jocOY9PGbd+YczYr9KVgVH47RFJZPcQpIYUfQvSBQtCHt4AM1j8pI
         Qm0w==
X-Forwarded-Encrypted: i=1; AHgh+RrctFrXxtc+stgokeGj2rOup5SShgtFKHrJtk8k7/mjvORexokMAeFbrTQEn6xU1YvWRA6pK/SX/KDc@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg6TFHDVXLSxHn9VcK/fKqp8XirkvxhMdKmy1AiUs0uBEWyOOm
	SZpcvkgab7oo8IioBHHw55k/KwMV0gJwrwfsc6K/f/PY/jqKkendFoSLtcPO2XgWF/ETdwTfOiP
	v5a5XcjsUN3z6iCK6rNXLPBfHxEJ1CiMswdT48XF3o4tDbBj1F5EktX9DnY8pfJyI
X-Gm-Gg: AfdE7cnB14u/1glKn3KbkFAg+R+h/JPI88R3uKs28jjq6e6tfOKmaiRB43/sl3sYG9K
	ot593J4/jEokExzGutwnO4/oqqvPAdP40+N0gSp5aTHD3xOUcnonxbFg84t0jRaqHdCi2BO2/Yz
	ZxtbFUkUFLn4MX9wu9uruKcLXRq/V8OG//KZ/P6wHYkPeuVUVnwR+L+VYr8IkgRAdJhTii3GH+C
	TPgZdq7kSgZrncaT0aP6Go1eRhKyFT9x/JS/w8i2oE3H2XGRwYECAPP/lmmyWeY+o3GNDrrrdlS
	q6HiiN2GF1vUqzFMeqT5vNJD2QaBpt3Ha+GPNeRVLC0KujWMd666htlzNSuqYxsNAPkz8f2v7dz
	LYYChTSYkqN7SgxpVj+5lwvErr/efrG7Ey3p88w==
X-Received: by 2002:a05:7300:d0f:b0:30c:f84c:b2af with SMTP id 5a478bee46e88-30ee1489960mr1774642eec.33.1782801045859;
        Mon, 29 Jun 2026 23:30:45 -0700 (PDT)
X-Received: by 2002:a05:7300:d0f:b0:30c:f84c:b2af with SMTP id 5a478bee46e88-30ee1489960mr1774618eec.33.1782801045153;
        Mon, 29 Jun 2026 23:30:45 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee320827fsm4128655eec.25.2026.06.29.23.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 23:30:44 -0700 (PDT)
Date: Tue, 30 Jun 2026 12:00:37 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: Re: [PATCH v8] arm64: dts: qcom: kodiak: Add EL2 overlay
Message-ID: <20260630063037.k47sbwf26l4fi5gu@hu-mojha-hyd.qualcomm.com>
References: <20260624063952.2242702-1-mukesh.ojha@oss.qualcomm.com>
 <8fbfa82f-aae7-48d6-9406-d04e719f028d@oss.qualcomm.com>
 <0e7a5719-9271-498c-bc0d-5fa76341ede7@oss.qualcomm.com>
 <20260629122248.yb5fe7rifdoowpfl@hu-mojha-hyd.qualcomm.com>
 <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b7d6e7dd-afd6-4ca9-bc54-4533de6b663e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfXwnItWpMX/xGT
 aP0Joa4netUWaBs2cRAIURS4oXOf5mwIVbJbtqfcnXCpFu2k5rPGh9SbASabVyKzDQOe2akN8mI
 XZniwFmvYOMJBOg6r0KjDd7myvKPejWIb7mikh62Xv0b5C9eBqfnxXWD9qv8EQ/VVKpBxj019sC
 W5dlR1SpWpF3bQVZrqIR7CjB0IYYLDgAcxnhQDX6Wo+S0o9WiT9SKYDkcPkBWKigvcsdedG0vSC
 gtm3jXBnQEjHxPbRIZVvmvTiA74h6MvO+CLd9QR1tZsRMZx7N4ToUxQwaO9N7aXqtZK04GNp/fk
 WPNFu/tdtvrVMkef5Hyjlvc8LbxDVFeGIAQtuqRUI2BNx7I8aFJb+OD5X98QZ11WU+d3XEE9eKJ
 BEYmxJ1hPOSF5jN1KJD89TY0oC7Pf+9To9JaV0+Dwym99M3SpOdNDWOFFc+cz3m03W3BE6MQowU
 MJRRzeAGh5sxPtbaPTg==
X-Proofpoint-ORIG-GUID: L18W5eBRquXQFJ_HoW2Xj7sev7T4qPq_
X-Proofpoint-GUID: L18W5eBRquXQFJ_HoW2Xj7sev7T4qPq_
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a436297 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=8nJEP1OIZ-IA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=l-lKhsVhalfiKrVvuzAA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA1MyBTYWx0ZWRfX/o1unJrY1AIC
 /eQz36njTMdhc8XBTmz3jf0Z/hKTcHce2kxeRj53LQy9R+tpcRyEtvbWpagpheKZejv8YJUtJJH
 3FO6vlbTAHiooO+FiKFsOnbFkJs6XPY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300053

On Mon, Jun 29, 2026 at 04:08:26PM +0200, Konrad Dybcio wrote:
> On 6/29/26 2:22 PM, Mukesh Ojha wrote:
> > On Mon, Jun 29, 2026 at 01:36:34PM +0200, Konrad Dybcio wrote:
> >> On 6/25/26 3:14 AM, Miaoqing Pan wrote:
> >>>
> >>>
> >>> On 6/24/2026 2:39 PM, Mukesh Ojha wrote:
> >>>> All the existing variants Kodiak boards are using Gunyah hypervisor
> >>>> which means that, so far, Linux-based OS could only boot in EL1 on those
> >>>> devices.  However, it is possible for us to boot Linux at EL2 on these
> >>>> devices [1].
> >>
> >> [...]
> >>
> >>> Is it necessary to redefine |wlan_ce_mem|? Can we consider updating |qcs6490-rb3gen2.dts|?
> >>> I have verified that with the following changes, *NON-KVM works fine*, and |wlan_ce_mem| is only used by the WCN6750 firmware.
> >>
> >> Is there a good reason non-chrome devices never defined that region in
> >> the first place?
> > 
> > This region is needed by WPSS and non-Chrome (Gunyah) has IOMMU
> > control, maps it for WPSS during boot up while Linux at EL2 needs
> > to map it for WPSS in Gunyah's absence.
> 
> Right, I'm asking about it usefulness on devices *with* Gunyah

Ideally, it does not need to be mentioned in the OS device tree when
Gunyah is present as there is no user in OS..

> 
> Konrad

-- 
-Mukesh Ojha
