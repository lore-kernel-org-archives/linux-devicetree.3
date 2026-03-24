Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558063F8E09
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774357980; cv=none; b=AnyG6Zu2jlp72+QSSkSK2yEFq/6rxQ2DfzKioxrf2HVyBld27euCykSNqEnHsnkbkwZQmWh1+UMtfzStbQ2OGfgWQnmCMJk0kp+PbNj2dMMsuUplPie8wHr5Y5N3Je3o7I0lOVpITEIy69Rg+rWffikQm4EXvyPFzqDOj+R+vCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774357980; c=relaxed/simple;
	bh=Wv1ee/UdWUibTfcvsLtCfhOHsnrgoqjmx5DCdPOFXKo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mqJY7Z2oTaUTr5CMeBgVestaelXy7Mz73NsKajuYfTPCbXtPCn4yto28oWbyBZ+DFsK2YMCwN3zhTZW1k9nZjuecMHB4k2oH5Etr2KEl/wCikOIuRZf5R48VVGR1vem7f6IWbIKJKi8bQU2VVQtyYTQDUaXmPnhogSHzPQWHwVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DoLVi22y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ox39SNM+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DoLVi22y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ox39SNM+"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O9fYet3903834
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=; b=DoLVi22y7xyAaNOw
	VEmC4YgWZ89U2jWU1jstWFgp6t+dgKIcVRoJ4uww5UbsdiW/Utoxug0gnJfLD5VM
	tJ/YQ9pFIxhUkxL+8TdYY9CfFja4Jw/+FR+cJFb8iZfowegTD9vx9vMIKWWtxQ8l
	9ddkGjs0H8kEfgwl2WRynWTYFrGfmTL/0sCzFTkc2fT0yDmoGK3YGHz6a4Hqusqa
	x6mAFtwbm6J0D7hE2vr334yJWwuRGhmW4BhMVuQIOgTbJWD6+/5vo14CHzWdVqbQ
	J+xU3hsFWu0OlUIcURP52BuUGt0h8wo+FMO2GFBYFN4rJTecB/tEXfpGMW+yAY14
	dp5PDA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0j25q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 13:12:58 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-94de248f59eso501976241.2
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 06:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774357978; x=1774962778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=;
        b=Ox39SNM+hFeGXWLXk/Zcln0kJrxOxiwm5scjQ/HnPE6SxIrnOBwbxyD0kdD9ArNsR4
         nr0/9wZefdQzxsqWH5Rc90WgxcDZ5huTdrv7u8m0kpa9FDL6c64ocigLCMA7X/DQ70Bk
         sboCdulcaqcgMaIzcjZxAA2KF/q+pOXS0MsayeApbGwCwABrTKSF6BZ0EHX73F5wnARu
         DdHE6WUAV5RDP2KFKQowy4ynQHRofXm/OMdtQ4fOZgBhVx744BEM8wdLod+3a2/5K0fR
         AZLCHDoCRnVwoQ+4QMqd60RGSweH0YRcEBICj4FqULnnozoPqzecg1IsfMGwb7YgPLGp
         Ydbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774357978; x=1774962778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FmTdVZdBA+lXMY5CjsSoQzxZqT+oe8b7DJtwkiD+/3o=;
        b=ATn3MeoQeTAyz0DQFhlKAW+9bszp/3bo047JWJWdcVbgczMVbC0z9v12a2D+xEu6jm
         HkBhmGAzhfYy/OsmZfENu0t3Ulr/X2w04c3PPmX9wrqcwa0IF1r2jFnm+Mey8l79lYih
         eoDL+djtkNP9V/yLOTbjobseagpgCPLFkLhdNw0tzsTAYO+1V6QhSAeZTfMK7+Ys7dT+
         83Yjy/+jAs90GRyGd5nnXnO6GM9NSE28GONXaV47FHjOf6KVf0O38t4Gvm4xkGt/4x4i
         tzsIlnNvDij1m08jOR9JV/+OF4A6I4kE4AMttdU57exs3FuXJBIi2g6x3nWTaLUh+Z2E
         6B2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYsiWHu2auBYVfxbYcPQ+LF5xweA1LjJ2jNWUmKcr1caHXZfASVGnfTjb6cGzRHQzwAGIYcxT3JODc@vger.kernel.org
X-Gm-Message-State: AOJu0YyAe2j7mCH7zYpykwSpMomlhGcVzHxkK3b+Me1lJBSALsgkIVAV
	1iS0P0mbJ/LMzK7nbWrURJKJDJ1l21g5alpf+Z71u2GEQVYM9oCcny2+5pYYnEx1U7nnd0kVQq0
	+aZcELaDQX648AayXUe8SRZHfcuFJCirkEpjjiSsLzjP7OL70UKR54waL/pe5/ryW
X-Gm-Gg: ATEYQzy48c14Feo0JTIOaXWlMWIjMmVrCeoZjAL3fJtkoJHw/CGKK14mBFsZRA6VySK
	1TKsxDbK6Zcezt3cCbQDoq/H65vlKst1I+WQ3wRaW3+OrhwNQoTy95PakFbNkuo59zFWQjHfrFN
	7gWv7WVBodOfqIqxOSXPiougghaB4kHEeBUTQNEAkV7fzjWsn6nYcUwk2cacTOCb6X7ozx5ooMh
	8HfvuMW7a9nHY8YJrS/GMbtEVGtET/rzOjqQ7hs/yO3Djkm+vDsCWZtjuze6Ir9hIK9qWpVSWPO
	KPExaX8CRMVZa8N4DlL+35etRt7b2UpcLIuDeL72ZURpnTTauGND9/T0vTb2OGqka0ocgpbsm4z
	JVE5e1Hv9R6w266KuGQtikq5T2Otz8GZyVigDtP/+TtSOZRCxRblOuB5KgTOQ1ItB+PHNbi/uZz
	FUsbk=
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr1187691e0c.2.1774357977678;
        Tue, 24 Mar 2026 06:12:57 -0700 (PDT)
X-Received: by 2002:a05:6122:13c:b0:56d:10ac:2910 with SMTP id 71dfb90a1353d-56d10ac2dcbmr1187686e0c.2.1774357977277;
        Tue, 24 Mar 2026 06:12:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8c177sm638398266b.15.2026.03.24.06.12.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 06:12:55 -0700 (PDT)
Message-ID: <9d9ec994-c954-445d-97b2-772614d66f35@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 14:12:53 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sdm845-shift-axolotl: Enable NFC
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Martinz <amartinz@shift.eco>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        biemster <l.j.beemster@gmail.com>, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, oe-linux-nfc@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260324-oneplus-nfc-v2-0-3eef052c9bc6@ixit.cz>
 <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260324-oneplus-nfc-v2-2-3eef052c9bc6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GqeG8fSKCnEdN0r32eYnexyVb2ezQqjB
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c28dda cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=IHWTUvJBEwR_a5bXKskA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: GqeG8fSKCnEdN0r32eYnexyVb2ezQqjB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEwNCBTYWx0ZWRfX7thi5zmb8dj+
 RNhvwkGCwTQmjIHe56uEJtS2d+4qoX9vQdS1YSaHq9mY2UErYR3HUwxu0ZwAW9QITZ9pWvYygsG
 GB2gYwY7590UTGtp5fMlg/ey9SpTYyK3OhIJRwZoRzLtPHZOnd3ts8+GF7ZN+qk3JI5TLSQ9w3D
 bjJ8+QhJHOT2E0c+55MaHMdn0IBS7yImIhre+N5Ij88N6eUBfi7drhu+La3D88lVXiS5Of5CtRH
 hPQYFuB9uWDdbWr/yLefcYWvYSnXUPR1T0DKWb1i1wr7D2gtgH6LKhYNOP6juapWUC6dyGMo9xq
 qsqKu/Jcjjuxs+SyY0i6uXjWRKari6jZxNd4IRDujNungtAqQ0pWdpqX1Kz1zyhTOm5hwY+NC00
 kzr2KP2ClntgYRF4M7nHPWlu5qUoeHZqO7/XfAUMHyBTCH4h70gcIQxFOVFrlDsF6y4iwrju3R+
 yy23oXUc6//vc0jvOqg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240104

On 3/24/26 12:20 AM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Definition of the NFC.

"meh" commit message

[...]

> +	nfc_enable_default: nfc-enable-default-state {
> +		pins = "gpio12", "gpio62";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;

Are you sure about pulling up an active-high pin?

FWIW TLMM subnodes are best sorted by pin index (although the file
currently doesn't really do that) as per dts coding style

Konrad
