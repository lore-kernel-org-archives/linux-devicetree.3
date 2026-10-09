Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94054375F96
	for <devicetree@vger.kernel.org>; Fri,  9 Oct 2026 19:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791572780; cv=none; b=UGZ2/F3pv3zgG/S/kQ+bHZTzQTgU/NpF4FFVH6MbWbd173BECXbW7BXX9Ny2DnSEQwQdnb32jy1hM2Ft6pU+xHO2fUCqafU0F+Yt2ffvcDs5GI6Wp2ygkEWs6JP5cGacaT9lqshAZs2gSypyek8JRYx1F8J8Ab3scd3MiMbJCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791572780; c=relaxed/simple;
	bh=u7EeM4iy2Z5Nrj4nm0q1gLTNL9MkAai50pDR+JD6SlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POZMvT3DnI9IFKbieWUU+o28A+nn5TREdzuH+m2p5V0BCVOYWCYSG1fRoiYHUOpKD2KwHz/iMagfYBEikZ7wihBs6jUpl1ErcGnVO6IsCkF3dQzSnZkToSlU1+hGtkq6vAncsMkr7hVQnlYnVbKDoYygOB4+xVauZZxlM4GJ+zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYYpycrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UIaxp1yG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYYpycrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UIaxp1yG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZUYq3477963
	for <devicetree@vger.kernel.org>; Fri, 9 Oct 2026 19:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vGuT4Rp0x4+w1/XEiKwtXsxu
	5Fnh/mGVWvn2UqQBCmI=; b=VYYpycrmTs8m2WP76oyq/+Oabg9bWdqWM4BzDFk8
	WI4Jcm3RF2WJYa76oSW4cnCk62doNlRvW9vDZL00geTgxQjndcRAmbk9Tqe9Pt0L
	mEU/wsD2bqwT0pnZpKvE/RkmNshfaA82owSyCYW0PGbkC/cpOfMyy3PeTFs9R2IC
	carj2j8hURXES2XfOiiJ9AbRgYLBEoMURKEugNpI9oltdeSKXFKqSMyhCqDo25JN
	+xCcwdX2hYFD8/WZ+sgrbYN4OPE0PWP0dmRg9Pe0PnOUQEOhOmxhiPQAh/gudoTb
	cPVZH+1Hd9a2NZRtzQt+G2pX4NSzMZjEfvH1AoMCl4Ttgg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t80bsq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 19:06:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5352436cd78so476541cf.0
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 12:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791572778; x=1792177578; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGuT4Rp0x4+w1/XEiKwtXsxu5Fnh/mGVWvn2UqQBCmI=;
        b=UIaxp1yGTbLa8fIt3+rvxB/3cEwDjLOsQEvwKmKlwwGI52Xk1MHRRH0xwSBgRP1vv3
         BK5OLGslOkSu+iN8horZz4ZufKQ1Jxhl7eSW/eis8zkjEHLV3SjON+Mrxbsz3uDuSP5F
         3zgM9/G+mnk/DEJbOtHsnkdEaFn6lu3lGtNoZLOI4PxXdlBcQz1KB9fWMTSG3M/JPz5d
         goZhUJ88r+NIkuUyNGehPxSUnEPTmIfneY9ooZlNeWB+NX3bUJTypPYGdOwx9VCP9y9C
         RxoAG3VGJ6DcfAWbbKbNjcslfl/p3pFany35VM/1HbKKyj7Xi0qTZpE4gdKNZJnHnoAB
         cj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791572778; x=1792177578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGuT4Rp0x4+w1/XEiKwtXsxu5Fnh/mGVWvn2UqQBCmI=;
        b=mwDnSkuBYiQG4BpSXIRQccWo3nm52wKiXVpXKdBwjc/sysbWieU9F7FizIKJ+edP1h
         34TVzoBrjZtABbCT8lXnDYD18AWCdr7MXn/xmOfhvJEbPJzGFnO+n3YBlF6mdpTkn39a
         tx0anpYu0yr0DDd3QOYVitFZaMNZhs7GPo/cGuRrWIizwvHfg61u0g7Iz8yvwlWu/aNc
         K3DMZlvbG+i1JgnkRQ55jGwwCynPJjjFUnZJ+bgTcvEC+Nn/AXFvWTA+QXUvVmur9cDb
         PcrUem8GWn8NYRyAUbhKYwywOPara+w178wFoWpFthh00beSbnPCB89sAf3yxyLAf3el
         omhA==
X-Forwarded-Encrypted: i=1; AKwUvBx2sZaR+3mKcrMdm7VyhJlqmubgGGVfmCC4sdMtgpZpSyFY2/Cz8CZ3LQPboD7GryI1DMEYaWf1fw38@vger.kernel.org
X-Gm-Message-State: AFuF++mfM1eEge5iow6Fezk9pti0PL3HaqdH408syjIWAA/JX8AUkbvv
	hSb2sOcOPDihaPRCsCRec9bMXNZ9r06dhgeDHx7ZqTHAR+1gAw8Frl0TIH3btRDGSodiWXKAVoJ
	YY4PUUOcaevrZg6cKYLhJOrqcZsCUYUrUWBhwEvGPhVjouYOj/ie1dCr0ao70SNOe1Y/KBB9irH
	U=
X-Gm-Gg: AYBFou2v2IbZNl4BhFuNnDzMctrSkChPIUaDl8QT801tmgxlLvDmKzp3rX1btEphoJo
	/wTmuWDLb8o7ChUI5cRV+YuvT2lVqTm4rdw7K36W/4MZ2a3HXFC+Q5x1rvfB5Rim/XjPwMoWKjz
	iM3/LdwwT5GUTvtTDoiHcZUGv4FMqp6gbHbKAMprOoNUmEM+dqFz2/H1qK2/3WuVXGgQDSOtzpA
	0aJS/X6+iMR9BMAU9xLDVLYZFwZ7aRIZnu+47G29VuzNaEgqdf0jntXUBUiw8KAWvGYV/ekQexP
	eM4T4q73e7iy2RPQ+TOtNmZNwp4bl71L2KGFiETFq2n7jgIIrlu8oJl/+sjxhTVEPwAKB2oKd3c
	ctn8AhPw+zp+HNxc=
X-Received: by 2002:a05:620a:3947:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93ebd24b46cmr491199385a.41.1791572777467;
        Fri, 09 Oct 2026 12:06:17 -0700 (PDT)
X-Received: by 2002:a05:620a:3947:b0:93c:b33a:5ee0 with SMTP id af79cd13be357-93ebd24b46cmr491189585a.41.1791572776801;
        Fri, 09 Oct 2026 12:06:16 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be8c5e7sm106746965e9.4.2026.10.09.12.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 12:06:16 -0700 (PDT)
Date: Fri, 9 Oct 2026 22:06:13 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: glymur-crd: Mark L4C regulator as
 boot-on to save power
Message-ID: <qp5brxy4zjla3jru4owvnnsp653mwlkh7u4p37pzg3ooagznyl@zltxjsqf3anx>
References: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-b4-regulator-boot-on-l4c-v1-1-7b76c2b2ea76@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX5Ae2HLGn2wt4
 lndvx+dr8lYQcTuyYk0gwFS9wYpNyxtm3QtJ5mgOsn8LIyAsyZ2OUCv3JRZPURsaoKxExMAYzjH
 fjhoPPQhnaHARFLXAvl+dSerIvJyr0I=
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ac93b2a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=R8p6_zuOKWCWefC-0toA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nohsTNVpyba0I4xTmUEl6yItHS8mi170
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3NiBTYWx0ZWRfX5tB8Abz5tQPQ
 /4mxT/F7V8K76q2SaEkL4dXTVpdUhKTTua0IhEtuK0dBzd7JDPZWSnr2dSVYMPbLd59VSqrVXuE
 PIgZRu8CTMpcsOx8CJddCEemq268LY/cISyym1zuWfYyQGzycbhlrrfGuOixvIiX3x0eJZ76tjb
 4qLSoArHs5Jeh+iUQk1FCw5i6X+bq3Yx/m/nhJTfMWnCTsttPJrdxJAMhKQurUt6UeNFxpw9qJr
 oXm+tKaz7TeF8bZpKlqNtren8Su/SGbemzeMj7WR4j3KaSIo8JkOKzZUG9bV9p6plvaqTkMTI3v
 ybT0OK1C8ImJT3qhBKU+UjOS4f7cQtjTrXGGD9vi1AZfpG4qjwZSn8vPxqC2Cm/cYrwLMq0wrP6
 yLofaAQnpRod4q9mWQpRjgWAbBANPqrFLJV0wxCCX4XzZh/xtYRlLpfdrzb7ptFj9a01DZ7KXuH
 YRFv4K4Nf+CnRh8pQKg==
X-Proofpoint-ORIG-GUID: nohsTNVpyba0I4xTmUEl6yItHS8mi170
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090076

On 26-10-09 17:36:05, Kamal Wadhwa wrote:
> On current Glymur Rev-1 boards, the third USB controller and PHY are
> not enabled, so the L4C regulator has no active consumers. The
> regulator node cannot be removed, however, since Rev-2 boards will
> enable the corresponding USB hardware.
> 
> This rail may have been left enabled by the bootloader. The RPMH
> regulator driver cannot query real hardware state, so without
> regulator-boot-on the core assumes the rail is already off and never
> issues an explicit disable during late cleanup, leaving it enabled
> indefinitely while unused.
> 
> Add regulator-boot-on so the core knows to explicitly disable the
> rail during late cleanup when no consumers are present.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
