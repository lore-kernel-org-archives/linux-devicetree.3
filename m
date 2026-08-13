Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58000431E70
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786604134; cv=none; b=UfwzQdSiYAHRiAbtvyb8abXB7laYWrbUtQK5cxuLHUeVkvYDyENEfAdCdpnDN1b5R+R+kENsQrJjB2Zb0ij5qLI6cKPlVzWreRg8MFstmaBX7Jnu4zJiqU2UFblHE8djdhuxRnoEBC/7/0tfaE9ZmEo7NsgUMhYMUA5TpfCgU/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786604134; c=relaxed/simple;
	bh=FyrXSyJlsKW1PEWcevNBLrlSX93u4IVPdkyJXqxrekw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Os4gQNcwcLyCSm9YPOXZuMIk0h5uifCtZst9oM62akjg1U++Ahl8Twcpli+gipYXhq8cgtIztsf390hfPjEaUMZUcAegHR75XwyEoMwDuaWMkx19AbSwr9anOWEZSIrcqhWkaiAcwJHZqKCK5nHwmE7ZlhrCId5Ttpx0k/3JYCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jJsd/OJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CNR2WgpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jJsd/OJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CNR2WgpM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g9W91874631
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z1oMtJz6T8xpPC+oiX/DPiDd
	RJnDulOaB3iaduLIdyA=; b=jJsd/OJJ8HDvczOUOuglGT47NRWoKoOj9h+uriVL
	ke1H9RGhLhap+pm/fAB8qh7Nba1/HF/xJxPxWKHMJbC3LBDLo1AJMgfg7VJPi5gu
	ixYlZxPI7MUG384n/oJq4UOtU3SWUpx6Cw0CE8OvNNN8/nRAZRcB559FMcly74UW
	vibyvzQRYe3rVSPkDd+s4HLiRpOVt5rb2Dc2PliRrW8mDSGQP3RJIvLxMtqNMZio
	xtkHnhdurmiw/+vxGY0g6bBDS6Acu2KSNPkJVYjFG3shHoRrl5+AqFi5iyZWh9p+
	kwReTJU97RsXE6J58CiD8tFuIXfo6DYLJ7RGx75Dh16HcA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g11ashpaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 06:55:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso2363197b3a.1
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 23:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786604129; x=1787208929; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z1oMtJz6T8xpPC+oiX/DPiDdRJnDulOaB3iaduLIdyA=;
        b=CNR2WgpMEBJhz8cJLWYEXEzjsamFWqnkGz7JF3Ch+UGVOsVuF4s5pEwFHPjX0N92x7
         I+jbwjPOTCBSzvCcQ0i3I6SDV/rzcrmdfKadHArf+HfWwXY8HvMuetHm5RlOKMNpizGY
         gbTgnM7jeU43ON/x9T6RrM+oh26zGcwiyo2KfTnB+vCvzwG5hAmyYQFQvNJX1lz9Ts/9
         6WXZ0w2mRsLNMjlXYDWZEopBiOL7GxF28VdgWYFk7ntUCCAEBNzt+nIkjCcjR1h5xr/9
         2YXiScoW+WGkGvjrNh3rOll7TKkgJBdSqm9/8LmH3rV5ChkO9QhZQ9BMsYR7NN2OkR7Q
         pejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786604129; x=1787208929;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z1oMtJz6T8xpPC+oiX/DPiDdRJnDulOaB3iaduLIdyA=;
        b=MmxD6YXqRIRh8echLYgGbA5Z+J8e3zq/gVGhGBswqT0Bkfm9xswrQ7OXlBrp1kEHfx
         T+Rq0JLxsEs5Wdv6/EcaQH9IBEmqpqn4fBbtomUspA7h0Fz149EOZPOi6l+a9AYOuYXN
         cNAySbTm/Y1hPOGUP1zyyO7q6fHKRBDhnVg7XV9pLrvJvczzO1vTuk014GTj8M3MvL+/
         mXodnzYFl330GXE0pDFLwXl8dz2P7zgymLoRCTf7MTZwKK+TWEeiDSQIq1l8q0i8ixgn
         PPqDJPNU84HV0vcAfYv8VeWM+Z8jd4IR4oJimkh/p5pzVZkDhsSf2gO3nO/kDnrx56Gt
         Yyyw==
X-Forwarded-Encrypted: i=1; AHgh+RqWav4j63VxvJFiUZDQa9ON/UeUNqKWZsnznnFGt9z2kPPNQ2FH70nhAk+/bKeA5bwFw0J77EDJAYWD@vger.kernel.org
X-Gm-Message-State: AOJu0YyMzu/Tq1sRJeL58AaeGvrv1LssW1xZbjK4XPmkEvKF20Nya9ky
	OGbA2/+5yW7cyQnK5r/fJ2oToLhLrt+LmBkz/JfVgZItvvEJsi1I4wCPFvJVKutnKgJnTk6W0Wx
	A1DKBS+3JAkBIrygPMqVf+uz3IDnbTGp6mjpW8/Qfixh16DneButx7NXWEGZSGEys
X-Gm-Gg: AR+sD11p4fx1iEQwthQ7NdGTs61ZTruSEhfqMtIih28yY/ZC2OoB5jI4YfB3OuLTHLv
	UcS8EGoshE1diVj05yFu3flc/ZlG0zIeuAND3TlnWV6KwRcOVQTXsESsHn0Yh29mMY84AE2AUk1
	3XkFKntOeZR4KgMKDg+3kKVnAF1zkIENwAbZGQ1Knae90COctMtrSWX0XiU+U31iNvp7kudx2cB
	PnoZFNZPT+uu/ANsAUDnIvfoLKS4M7tg9q+gjFIxQQwbVwx+vWS9J4PTjh0tUEo1Uq9eJseh0J+
	Gc6u68nN/v8bYsbI3inBvkxDHV3R9PPHw/0JxEcnqA91TtozBrdHVgqMFJ/CzdXt+kIM2FIkTJU
	uP7iIxHhZwpWLxe31WI1ju+oDWNNs0jJwxBASdGhHPd9GjQ0=
X-Received: by 2002:a05:6a00:23cc:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84fc6c3fff0mr3503178b3a.0.1786604128803;
        Wed, 12 Aug 2026 23:55:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:23cc:b0:848:2e7e:353a with SMTP id d2e1a72fcca58-84fc6c3fff0mr3503125b3a.0.1786604128277;
        Wed, 12 Aug 2026 23:55:28 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84fc4781978sm439476b3a.20.2026.08.12.23.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 23:55:27 -0700 (PDT)
Date: Wed, 12 Aug 2026 23:55:25 -0700
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom: Move x1e80100 TCSR to
 own binding
Message-ID: <an1qXeZoTdzrXqVx@hu-qianyu-lv.qualcomm.com>
References: <20260812-hamoa_tcsr_qref_0812-v3-0-dc7627169c6d@oss.qualcomm.com>
 <20260812-hamoa_tcsr_qref_0812-v3-1-dc7627169c6d@oss.qualcomm.com>
 <20260812-lively-determined-loon-31f65e@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812-lively-determined-loon-31f65e@quoll>
X-Authority-Analysis: v=2.4 cv=EujiaycA c=1 sm=1 tr=0 ts=6a7d6a61 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PqT1ZXtJkh0dzeW4At4A:9 a=CjuIK1q_8ugA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA0NiBTYWx0ZWRfX8NR7Sg+Kwolm
 2EItnNC0OX5n0RPo1XtBpD+qAN5nZLyCaCPtp3MPUUPCj0KXPI22SJL/Z0/Gue6IjOlv9F/gkqq
 q3ankllaYRRA7zoBdiu4ZzEdzjeozj+YrKyBh65Vqgj/GQ6yujIx1wg9RN/Nh09EBcuoAgZEYLS
 Yp5B2T8TKfEEaiJF5kE9K97GMsOzzRoZU514JEsP2mZMC16kikG0ogj9OUOwYDizW0u9TgHARqR
 XBARpvBrecvPNbnv3DMQZS8xA7MHyPa+nLr7p8z+lmUCb/JxptdF+B8R2NJTI1xHyJR0pP74apd
 Xk2LmMXCK63TmXdEoQ14zZOO73NCz+8GL3JWADe/64D0bQ80Tt715EqmQxucW/3JZAUJDF+TqTO
 W2X18y19UUF7VzsikupclIPs20MaGmRFQw8SNbw8k2ZgS6yEBSNcI+2ghv0PWITqFaU0IuYPzQ2
 nobosfThdDg5hZmHieA==
X-Proofpoint-GUID: lXmDDCpDgu8_uKBOXbZVp5BCWu9HCzsZ
X-Proofpoint-ORIG-GUID: lXmDDCpDgu8_uKBOXbZVp5BCWu9HCzsZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA0NiBTYWx0ZWRfXzRIZ0TMvpjT+
 320iArhQo+q6sFFONCCwkB4WbobjRIWNuXNozpscJS4c1NFFNPElURsn+9Z1pbBDppkE+5cMy+h
 Id4Z1m+lfQZYDRp7UkBojHpx6eQqwNk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130046

On Wed, Aug 12, 2026 at 01:20:39PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 12:27:31AM -0700, Qiang Yu wrote:
> > +  clocks:
> > +    items:
> > +      - description: TCXO pad clock
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +
> > +  vdda-qrefrpt0-0p9-supply: true
> > +  vdda-qrefrpt1-0p9-supply: true
> > +  vdda-qrefrpt2-0p9-supply: true
> > +  vdda-qrefrpt3-0p9-supply: true
> > +  vdda-qrefrpt4-0p9-supply: true
> > +  vdda-qrefrx0-0p9-supply: true
> > +  vdda-qrefrx1-0p9-supply: true
> > +  vdda-qrefrx2-0p9-supply: true
> > +  vdda-qrefrx3-0p9-supply: true
> > +  vdda-qrefrx4-0p9-supply: true
> > +  vdda-qreftx0-0p9-supply: true
> > +  vdda-qreftx0-1p2-supply: true
> > +  vdda-qreftx1-0p9-supply: true
> > +  vdda-qreftx1-1p2-supply: true
> > +  vdda-refgen0-0p9-supply: true
> > +  vdda-refgen0-1p2-supply: true
> > +  vdda-refgen2-0p9-supply: true
> > +  vdda-refgen2-1p2-supply: true
> > +
> > +required:
> > +  - compatible
> > +  - clocks
> > +  - '#clock-cells'
> > +  - '#reset-cells'
> 
> This is unexplained ABI change. When you are asked, you need to address
> feedback from LLM, not blindly implement it without checking its
> validity.
>
After adding these two properties to the required list, I ran a dtb
check and saw no related errors or warnings. But I overlooked one
thing: my dtb check was against the current tree only. This change
could make dtb checks fail for historical TCSR DT nodes that did not
have these two properties. So to be safe, I don't think they should be
added to the required list.

- Qiang Yu
