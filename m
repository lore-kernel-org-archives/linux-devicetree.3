Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6674C4848AD
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 09:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790932504; cv=none; b=DvBlFW2sqrP+DmIM389zAiSURpJ+H/fR9CAEeWI3yOIX2WgRt0QZl3Fn1mCTC6q5OohMBaOl6xeLHycK9lidK4/eVBJgUzmigUplZWUErR+ziEhDAVO6AMeedLOioRukJ7sfIRMieGokn2twPhpey2YNqEPBNaVfABG4o/7sigw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790932504; c=relaxed/simple;
	bh=3HocdeeRheQQO46Pz0tMPvTq4Z3DnJWQAQTkfu7sf3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/rtApOMFsrI4fCPMw9sMWA7EbcZ9hfzaJKqDHXzYeAY1deU/2/E6tnYJuDiPI5GB6KnU47REE+NJBBGP6/f8lHgVh8wrkAmfwHZz6pQxLT53wHWkkfDrAMuvXkS4Arv7HXlkUiAc0OPYJQJqhg3gWLDF3cPCmYGiiVyXaj2xk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc37PbaA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ihn+1CxR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc37PbaA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ihn+1CxR"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6925jSKW1543617
	for <devicetree@vger.kernel.org>; Fri, 2 Oct 2026 09:15:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K/PRJxeffShrr/JXYd21vlmy
	YtuaDFVG3OVp3sghzLg=; b=bc37PbaATmiuMJYseuJsTvX7Sc08AUAMQm++Zpgz
	VHYkawS2fU+KjRdE69FeeXBoLXjZAEJ4S0cijkTRZFc9Jf+G+uw7tsINNo5VkhSJ
	N2BfeoPSeVQEwinMW8uHgNO68ky2zOmmpqqAhm3sHU2sTukaj/a66R6oLxYQMJdQ
	5+kmzZC5c28Gb3dHW/BNos0HM6kd02Iv2/1tX3gDDkUy3gseoArdx0Vs77wDimvr
	BErNgMXY56sufdfV6VLruoLQtDxuhGWSCDQfFERPQlcgoMD1jpW1hTB7J35onkPQ
	Aruh/8GkDs08H+7k9yDukAWftJ6T2Px0KLz4X+kAt+k+1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256mrvt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 09:15:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso1170758385a.3
        for <devicetree@vger.kernel.org>; Fri, 02 Oct 2026 02:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790932500; x=1791537300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K/PRJxeffShrr/JXYd21vlmyYtuaDFVG3OVp3sghzLg=;
        b=Ihn+1CxR694+Ki5P8AVkSD15y3qYFhHGPkjTjz751lYPO3BwolD1Sv6jVgv17Hj6mC
         2bNrYl/UVXLdmWKhcC7vfHpMz7XkGIUP0kg6Wzx355dSYVn7VdONATyOnhQ1MdjI6vbQ
         4YL8frzCp6EPSFPtp6WPQx5nesTrZZ76OSBOdvjrMuMQEQhJfmEiNDNB+bK+tJWelB79
         XhIexDBMPfmtCkD04U+3aoBO2gvkqdRhgv7ci2Tf82RRaDiCeatlq3bQJEZdMfGlu3SW
         dffhTnNzZj/DZDUiuv4+TsxmsMrqHYh5QOlQMg7nahCg8MUbewUBlerGXaPdj6blRkyM
         LjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790932500; x=1791537300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K/PRJxeffShrr/JXYd21vlmyYtuaDFVG3OVp3sghzLg=;
        b=n/GzW/wet8740HqTJrkInqK0Pi71x6W8eN8nOBicsrT1K8gr0wZpHxtgsBm6dREJPO
         6p423BDh8hrvP/qsTpJ2vz4R5V0UchuXHBY76AnBVCAD2XV95YCdH+cUhrXu5A3f5ZuR
         OgHF9VclKxfQ8x5JF8UXairLGCfhYjP3Nvop54tLwP4fgvEa3iJPJDkW1qAhQg9SndBq
         8mbOKt7bQZSYh+DM4PURTKKltMsI1GJRLemVH/5E65wPxy+//gHQc3GLkV21+uyMydP/
         edK1ByZnu5/QG7wzZNGNAXDPqVmKHMuBPkDpmF75m6j/qP6ZM5sFGVtlW13PPsq6v62t
         yhJA==
X-Forwarded-Encrypted: i=1; AKwUvBzpA1G4XrVyfeOXptUTm98wjzxmMXnZYbRIwdsmOAvkifpzt9G5xsZL0CjXceD9F7cPKfpRa6+wLrvi@vger.kernel.org
X-Gm-Message-State: AFuF++mm28QQvqlPFFCm5cDC9vxhAH0irwVjwAF499YhAqRlefhjpabl
	lzpwwkpyNIl0wgHaesDwlEWka39kM9/VraK2UESJbydosKq8xJscvO9aaBeReS9Uk3NAiZ2m5Jg
	w0D7ujEkT4d7qtybRM0FesrRjK/W6TsWNBk1b2VGxZZK+4IJ+9c3TnHx11yCPWcru
X-Gm-Gg: AYBFou1k9AoeIDDl2+0MyjT/8NFga6oLQX2d6ItCHtnit0CbbUoo9p1AZAFSrMt9cK/
	a1Z+T4v9oPCELpyz5rU5ReYV3pFbjTBSF/mJVE5snxI4aZPtZmNtc05ej6GZ0nXwXHFtuVlBANX
	U+sC+3KLUDc/GzG67Nb7+Ha9f45EG6A/W1b/QtyBx43SVjRx0uMjd3BAez2RsvRmKISz5L1bJHd
	OmbrEYbd6mkudzb6+Ma7UTUGByI+MCONa+M3oKhdQPfPQKWyWU4nX4lp1v5RrKfWY1jyGYGDd2c
	SzSurcAq0n2Ve++xN3ut0SuRcYE4Rn/GeIbSFUSojqzPN08rv0mE1pZCcAqBv7jAi5sR6vyhD3z
	Nl82XeZN6rCU6fgw=
X-Received: by 2002:a05:620a:630f:20b0:915:83f3:780d with SMTP id af79cd13be357-93cf16e840dmr235971885a.32.1790932500453;
        Fri, 02 Oct 2026 02:15:00 -0700 (PDT)
X-Received: by 2002:a05:620a:630f:20b0:915:83f3:780d with SMTP id af79cd13be357-93cf16e840dmr235969085a.32.1790932499863;
        Fri, 02 Oct 2026 02:14:59 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b82253e5bsm3726616f8f.1.2026.10.02.02.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 02:14:59 -0700 (PDT)
Date: Fri, 2 Oct 2026 12:14:57 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: shikra: Add Iris video codec
 node
Message-ID: <mu4zrndpmiov4ctre74rp5htbcmg34vcneruytx22nny7i73nl@h6u3jkevtdht>
References: <20261001-shikra_vpu-v6-0-37143dc1bb9d@oss.qualcomm.com>
 <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-shikra_vpu-v6-1-37143dc1bb9d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDAzNiBTYWx0ZWRfX4e15+PUS6jtB
 Jl5mG2/keDS/V0p6KtLn5K83a4u+wM6Qz+/s41lyuN2/9xzBK9AyLC642qlhgiqBPwbCRMzDpY7
 ETi/RQsraUHPWOdf2NJujt3KGC2VzBI=
X-Proofpoint-ORIG-GUID: HVd9Hl2I_EG6oaEE_sNMWFpMsoS6l4F_
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf7615 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=HQjVKgPNjbXCzeIY3TQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: HVd9Hl2I_EG6oaEE_sNMWFpMsoS6l4F_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDAzNiBTYWx0ZWRfX4RYG6c79Bzcf
 n1kQYLV0oyGr093OnDRM6bXBfHDI1vNbOlxlrJOLgJTvwZpi9zQ3RHrkgDmrzJV1tClyyuFuPNm
 3Ah+uI7u6eFz7OjFVo+BF02q8L8i4Ya7qTFWRdm2SS3YYrwsM5Ge7Gryzv6kPg2q5QzXMRlAxFl
 38+2lSwZGTgHatkNUsyKTZCgHhz1gJnRaHRw0tx/12CNyfOtnCS3xyKUpbsBCoDYSrwPcv7bjGY
 eZA85sxXI9cSbI3CbxthDzOS5YHWRA2vitaEsY1R3TNzVr6N1cNFnmyfN6i9V5LtXAKnxWjhb3r
 rnOFFlhtPWCDGifeoOYZCqdEzrom2jRKgkS6VvqyhaKI3pW9guoE+Dp2mLnjA2uD+pgJVwhlZ9X
 6bf7xRdFDG4VnYYN1+zozdX1K42Cx2c7n+YAA8kCz7qTkg3knegGD7qQ9zcfVmk05/6YdzMVtZb
 UbWECnEUbBjYu9V+wNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_02,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020036

On 26-10-01 19:11:56, Vikash Garodia wrote:
> Add the Iris video codec device tree node for the Shikra platform.
> 
> Shikra reuses the QCM2290-class video hardware and programming model.
> The video node is added to describe the Iris based video decoder
> encoder block, allowing the media driver to probe and initialize
> the hardware.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
