Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755E537A4B8
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779347631; cv=none; b=Va1OScGmEKImStnrALtcUSOwitJJh/bE/lZUHLKkcakn7Vlh9SaKEhsSUY76kqJJbIYFvAYADC53+54l2exouFXaYW07AzpO3kVn5HN7ug+peR+sJb+3YxJXpGOy+Jj9TUzpVsk8gC4hTVdAM0hg4s2txadgD8kOEGEThAkHhqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779347631; c=relaxed/simple;
	bh=Te1NKs8fWDO6XlMA+s25H1UFXnbbfZgyLuRr7W5e740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+xJwJ+8GcaNpX1xlkBU82q5YH7w4wsV5lOSgFXuw/YfTJrmmivw2vqwUwc9C18vXd+6mT7RheZlGWlS8PkU3+1b5qVw7GxAE0z88GghU0w4vTYTZdLcjjre+8yMY8SpMjvkEiVMk+hyZHSG5KOPAdbiIID4fm1Cc0UT4ceIDPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCY9f/ZV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fQk1xltg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCY9f/ZV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fQk1xltg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2SwfS3815914
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:13:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iQSxh8R/sOxApxveA4z77LyIilrjUVkvImF6KBXRudU=; b=CCY9f/ZVbVYsHv06
	Q+zbIyNiJrwBIG4RrbwGtnMtyoTKSyZxnIboHwZYUjDMnJoCnSUDQpVTrUZuEj8q
	3Uzy9T9Si836ICv03FAakg58TJhxhCSaBL9aI3Y2lGldYA6WO0PPrJFicXKPQrFA
	Gzj+019i55UYx3y7MvpOSuJ/tJpnqte0D3xyw1bi9BLyGmePE1SEMP5izlxd4+5E
	cuNN/kus3khQfs63pDa4ZlQmZFSAKiZ56KGKmkhB4VlFqIq5Kf2F8dxkXpYpDjZc
	a+edAiz78PBlkB7HbFxe6H6GFz4qZTElS94nsdRqcXIDZdXdg9Q2YajfDYp2eE9+
	hn55Kg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa0xev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:13:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837d43e9ff3so3761568b3a.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779347628; x=1779952428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iQSxh8R/sOxApxveA4z77LyIilrjUVkvImF6KBXRudU=;
        b=fQk1xltgH5GZ9YCJPVuUvpBcBKf0jf9liSvUWAM/mfjOiI+Lo5SiAA7a31/f6DD/cF
         VbAQd7ty1vP2Rtokoa7QXpqML8ehXuMcDYC6xYpi5Gott1A3kWlxPZjG7zkeM20wcw7X
         iJa+YMbVbUxpTtiuNESJcBz4Z8MOmK4Obe3PFZnajmU8qslV6yowIHtpOU2CD98I5bwJ
         pIdcnBs2Uh2RytPpXcKVc8Uef2t09zYWj1G0ntxFxmp5xwx1hBwx2F/mrkFC7+lDFtFy
         cbXOKI1HeK7cFcixE5Pwu5403PhPd/fH5rK/ryS4xeZPrZKoFcBYJbwQ80Gs95Sv/h23
         3EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779347628; x=1779952428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQSxh8R/sOxApxveA4z77LyIilrjUVkvImF6KBXRudU=;
        b=hEBr3qBhaAjfC0UTuw3O5zFzm4x2vLxywdKn8iTX7AlMTNgl2g3aNRpBzYh6CtaEke
         3f/hwYEsClXTXTBvNhmhR63ZZwE1so3emjCP1lrOJ07VfcVa6yDmYqqVOF293b5xVL9i
         cO7ElH0WGgUU8BRQExs+FE8/9bCadMSYZPup0X8IGmgdrpSl9QVfcbMjQ5/WqO0V6hk+
         ArZCvJu9+8xG8rJ6ezdktLqJLdunXW9/blfTxaIVP0eGzfsrNjjGZjrUC1lZ2MoRVbTF
         skZtM+oZwWQJxkgPGQmNJ4lQ6vmOaULC4gLXQFUDqbzC6gf14xZ/3uhO/9dhp9rafcai
         U9fQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Slwgprswsd5Z/KYoTS9+Ndv4pQuxeddbcixnjZ+sF+Clrurez8jeXG8viBYo8dlxFJNTz5NZbXmlg@vger.kernel.org
X-Gm-Message-State: AOJu0YxfeeUa2oiR7aWBr3UVy5wiypzEv+FU2Sb//Qb2oDAptQmezGzS
	9QopsmrHc2tICH/z8ZFvI5fY0cXNi6tbvOV78g1OqX3bouyuISpe/ct28hDjwr7uk1rraxil7CL
	2UzaryuD/V+odebXpy7rBIGxhDBZ57e9BcYKp7kYHpET7eqjw6J2uohHIWOSWpimV
X-Gm-Gg: Acq92OGbcA8BPkP0HH2qjD6tBwl1qwgWFddXdqsk6HYeWbRW1Tg6+tOivTvsbfcpxNM
	EG8jwombRiVrcczji/8ZSClEJF3tn2+BNvJVXZ15IwZ3MxWi9SGqhh+eD1Qta9w561LpVebjQVp
	uGzGVqo4+Lu1yr2uLmKrrnlvqDkYvudzOaUv03OBV2BZP0ChFHWnlCp4YL7DTCn7llnKzYNxZcV
	prH+4qzpdCYVsEHcXm6Ooynd9WTLkraRhff0vLFwqye8DvLiSSARBp+S8HeVzPQo8DjYa2/F942
	ckq4aN3G+43hP4smfMtKf2xOh1kbRqRs0wyOI5F5jUurJd61klTGQCF16zX9VSV6ThEwBgWjc2p
	MclodzlaLbJr+PCvU4h4SRoabV9/5DxDUSg/7OAr7ykzU3LoomamMLSOkMWL9Tg==
X-Received: by 2002:a05:6a00:bd8c:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-8414ae5d79dmr1859342b3a.42.1779347628416;
        Thu, 21 May 2026 00:13:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd8c:b0:838:20b7:40ed with SMTP id d2e1a72fcca58-8414ae5d79dmr1859287b3a.42.1779347627934;
        Thu, 21 May 2026 00:13:47 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e44a67sm307513b3a.57.2026.05.21.00.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:13:47 -0700 (PDT)
Date: Thu, 21 May 2026 12:43:41 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, jishnu.prakash@oss.qualcomm.com
Cc: Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        jishnu.prakash@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: pmic-glink: Document
 batteryless property
Message-ID: <20260521071341.q4efqssppvettaey@hu-kamalw-hyd.qualcomm.com>
References: <20260518-add_dc_in_support-v1-0-31fbaa329879@oss.qualcomm.com>
 <20260518-add_dc_in_support-v1-1-31fbaa329879@oss.qualcomm.com>
 <fd58d6d7-26cf-4b11-82ad-05b4863b6dd1@kernel.org>
 <20260519082526.odmn5dqi2jftwnln@hu-kotarake-hyd.qualcomm.com>
 <20260519-first-wine-bulldog-a6a4c7@quoll>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260519-first-wine-bulldog-a6a4c7@quoll>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA2OCBTYWx0ZWRfXzWoj/9CUwRv5
 M36ycG3Kf2UgD+i3o+ZV+ZFrmwE+pK/zhDMeiucrzLOTyyqtxNqbEi6pe1wrpTIBjNSOHvmD2vi
 iSztK7bDC8rwxbtbJevUq2JbKwbQBokmFhd/KY8PBPh9v+q84c7uxlP1Y9Hu7dhf/Ov97DxJtqw
 fZWdf/U2ni3ZzYW5tLb8vIHpbPMDEZsAlvNStrMm1fK9MJmkNO0jx00IPx2Udhc6gPbd616Q+hB
 smXx7FKRWeNXDeAwopkl0BvFVeTeo+t3aRcApwWAr/BH8EjLjR07MlBTBOh28LcMjMvSXxxL56e
 GJB1RdEz5+tZ82yDVnjv7rM7gSnlHqswNqAMGdKXKNDrBo7tUvxR/eObEUshGfW0E4uv7WBVu/v
 KQZptj569p558pqyETxW5AVhVY1XrkP5LYtALIrAdE/HKPY7XTQCc0NPHjfLFcrJM0Nc/GQsK9a
 3EAY4eQsM827TigSlkA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0eb0ad cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Co5pMWS8BZywBcWCmhUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: BARJ7GMY748oA-dDk8vvcQrtTcB_WpSy
X-Proofpoint-GUID: BARJ7GMY748oA-dDk8vvcQrtTcB_WpSy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210068

On Tue, May 19, 2026 at 12:35:13PM +0200, Krzysztof Kozlowski wrote:
> On Tue, May 19, 2026 at 01:55:26PM +0530, Rakesh Kota wrote:
> > 
> > > And isn't lack of monitored battery property enough to indicate that?
> > 
> > Regarding monitored-battery — its absence alone isn't sufficient. The
> > BATT_ID line on debug boards is pulled to ~10kΩ, which is used during
> > development phase where some battery properties are still present. The
> > same ~10kΩ value is also used on some genuinely battery-less production
> > platforms where no battery properties exist, making auto-detection
> > unreliable. Hence the need for an explicit DT property to identify
> > hardware platforms where no battery populated. 
> 
> I don't understand this logic. So you claim you have debug boards which
> do not have battery, but define monitored-battery? Then these are wrong
> and fix them first.

Actually our firmware treats the debug board as a "fake battery" rather then
a "no-battery" case.

This is done to avoid triggering shutdown or trigger power/thermal related
mitigations to kick in from the HLOS (android) that is configured mainly for
battery-backed devices.

Note that we can know if its a debug board, just by looking at the battery
ID resistance or the battery profile name in the power supply properties
for `qcom-battmgr-bat` in sysfs.

However, the problem started with the boards that are battery-less and
unfortunetely used the same debug board batt ID resistance value, so from
the firmware side the batteryless board is also seen same as a board with
debug-board connected.

Since firmware does not have a way to dynamically tell if it on a
debug-board powered device or a DCIN powered device, We are required to
add this new DT property.

Regards,
Kamal


> 
> Best regards,
> Krzysztof
> 
