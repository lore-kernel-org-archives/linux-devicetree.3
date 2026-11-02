Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793586724;
	b=AIQzVFF7bs1prg1N6wieBw0yzKfimEcQMmimVruID0KK+3/ZjwhrCeoZUxpLF6dye/an
	 GA1/slnfpoIEz6+6I7s5GRAX4bF3oXePLdp9YVSJGJhDd7S3MTgjHd38VgdMvGVKEwUIE
	 zzFcVbQKtEZvYsDjSiSyA2dFxP5UMo4UdVW8lSYRkpYhAxujh1Swy/B1REh4P8kkRz2k3
	 eWSs724ByS39DdLaDS6f2WywBzt0BXmwPp33Qh2kkuX7OwiwjwhDVGN0EJtQTRJU49oPS
	 bVX7fEasdf4FFSUzJF14G7Wjh+fDoCvZ77CO0JgCWeNcGROdDDlFhtDibfBltkW4GiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793586724;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
	b=eirjLOPSm+w9x2dkF2yj+ACZVAAThHpK+XoawGOOG00Of576YWVUVw2FE+k9Bwu5raBw
	 4RwQdJLe66q3uFe2UKAiqh7WrS6ojvPibWEYC09MNy9TN9zfbsjR9oXwUurxAJK+djK+Q
	 1I8ZHRgcnn+FGWcaljFuFnqiKA6YcELlHWR3qgYa8Bwy0stfB17qATjJhdAXDO6/cIi5A
	 7gpkOjRhHypytIPqyy2TSr5zue+ijvzq8BFPay91uIZmxhbxHRhryVuBGOcHP+uxzieE0
	 6vkDG4u66eqg0F/gzTOSIYr/nVPtLYBJ4dethbR7kv9qC2aJhp0nondNl0uQf+lfKhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5kZ1bE9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNhIOhdU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D26A606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 02:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D26A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A5kZ1bE9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UNhIOhdU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20LsEB2867699
	for <devicetree@vger.kernel.org>; Mon, 2 Nov 2026 02:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ON33HfWPDSeusn2fBuQTwDOH
	kQdzOEPipmglvQYmFTg=; b=A5kZ1bE9RodCEQBCSQF2L7ee8xvo5K9EKwKOx0ba
	EGTkdB960RyLZXXNsHPwCRfJSbBRfUlkkgXZQUBoDoHQvWnLpQW/obcorIY9T7le
	+zcY0cbbohByBiftlw4GbMm4QNOszsPVI9ml+x4Yv+YvUGkzRoWwowEgeiNwKPjH
	xoZ93fwyPfWMv3ZynDKPHvglyT94OaYeB6sn5APBe+RmKfPbZh8m5gQDZrSua97n
	1PgTbRMZOMnt++4SPuLpaRY/xD1NGmS0/XWf47HsCysFWu7EPfCyiYUe7pi/rnVp
	w/dB/9loTfd8Urrdaa4ZVnMZ4Qb0+R9jv0zuCihRlu4KiQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6mxa9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 02:32:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3554214eec.0
        for <devicetree@vger.kernel.org>; Sun, 01 Nov 2026 18:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793586717; x=1794191517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
        b=UNhIOhdUZQ46PJUQtSFVP0QxK4qFPDT7LqEXQAEyJSCzv2GwjUEHa6U7cDW6D3lAbF
         oiewoYprib1LKaHY6KlLd0dXyMqKzQALjIFj+y1lDQGXb8mrcfrWOSbCx/Dh0DgSBADJ
         xCX5CmI7IiaZwfM3NxGZsg7p4qLGEpnSAICwzRWnzBqYzkCRMPS4DUjgR2R9jVLU63Hw
         oTFv8vwGLK6Ds/9KmuP99jxUuvxQ868BTVOmEgT+lS75C5DMyKvS/9xVDgoL8Lc88knj
         +UIKVPHQcNcnqtspzpo70NeXtz9Uvh0N/qqkri14EHHoYVfEyPMpKIwSL9G0TNOynxxg
         JNHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793586717; x=1794191517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ON33HfWPDSeusn2fBuQTwDOHkQdzOEPipmglvQYmFTg=;
        b=IRJfNMpuRafECi0py13DCEX0WM0YAh62canEo2lhM8idDWf3h55e7Unqj0QTQgXkxR
         mHMnW8EzLzg0S74J/FPCyn8rCtP/94MlmhN6d0KgVZl1Vzr6m+VM/AvnJ+K4zDcIfk/U
         JRRtUxg3VlV2ygJexUvut4VbBmmwgrk4f4NzePcazgqwUfQnxSwwApvEZGztb3nwCVs5
         KQDoHfKdvyqBWkN9EkXMtm3/u10gmqawywZFJZvrC1Qh+nl7V/lf00u60xJcONq2BSaN
         cRKUozknJ+/fwCHIcD3ueD8XDT/3PJcETV7ZZUYbD/lYk8Tr5TmUhaPJMawV7rBSK+R6
         YlgQ==
X-Forwarded-Encrypted: i=1; AKwUvBzG0eEi2pBd19EKWmEaC2Cu4MM6ZG98SYG2lEPUnEkdE8WpinW/SgDyF+0SZepTmdhJnPr4cw/IT+6z@vger.kernel.org
X-Gm-Message-State: AFq9FYJDmAu9NQm3c7ilen0GXlnfWvtzmEaBacGv1cavVRzpzQ6gPMgz
	VyAw0q97Q9ioPoPa7FFDWe+ObB3NWOfxFCrV3xJCHaXfQcWyNZ5aHStgtfioP2gsukU26MAJBRA
	cGiN4xPoh5Cy1DQYIHG3gPMXGaVRrJqvKtLP6R5Lyru7XdAU0BxGapHznPq/o9CLA
X-Gm-Gg: AYBFou2Fta8WSweZpEFcXoeJxCl02j0QPKHw5TRuadqltJnm3Cv7oGjpoDlmrBQEwSb
	5UlzV/e0FTD7vntTJUFWzA5qLhwS9LBZYctn+hiT0p1aQ/7fsTMssuPYCarg/IKQhQ88YfVAoJP
	FiCsKG4SaIemJtk0W6EDwSbb279cPLaPlrXCWku8bcAelE9IMmAi5ive9a8qLaeHN7i3ZLOmnNu
	m/+qjtVYheRfyuzh0xe4+tfr4Ml4GebP36BGNKrSzlNjGBb4DH9UJto3JEaIPE1NuhzuvnBdBlU
	+qVRdJEoX43a5RIoMlOiGIIv3luRTBRic0fu2yjBZ9+EfyGtmgBovEoOyi0uKe+5qeF23u/SvSY
	U2BT7TQAhJ0glv3FjAbM/fPYi2N3BgsxOI0FkW29w3G89rIo1H2GjmVx7UvgjY+/PV5jICw0L4C
	rgRS8EiyjyaDto4g==
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10957223c88.9.1793586716820;
        Sun, 01 Nov 2026 18:31:56 -0800 (PST)
X-Received: by 2002:a05:701b:271a:b0:187:c940:21b7 with SMTP id a92af1059eb24-1ac5c55491bmr10957199c88.9.1793586716340;
        Sun, 01 Nov 2026 18:31:56 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm26876256c88.12.2026.11.01.18.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 18:31:55 -0800 (PST)
Date: Mon, 2 Nov 2026 10:31:48 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Message-ID: <auf2FHHbto8lAf47@QCOM-aGQu4IUr3Y>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
 <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
 <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5b53ac2-87f4-45cd-9667-91cbb45fbcb0@kernel.org>
X-Proofpoint-ORIG-GUID: fxyiyWpYeF-6D8YpO2fWRs4jmnkexJk_
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae7f622 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eYKOoy56NPTa7UcXW_kA:9
 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fxyiyWpYeF-6D8YpO2fWRs4jmnkexJk_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX+jNcDnVPFZLz
 GZ+/1Q0a/qjuGHMkJJ9X49ubBBPf1FYuU8aONTaxhS0TorVfuUtqnGb0gnYepYD69Y9anXT1qll
 AWisw4mC1jNSvz/Y+3xKMuq2Iat5QFg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAwOSBTYWx0ZWRfX/Ji2APB8NtXO
 JBCQLOHvafVX91O6c0WGYPgG8tnpWwu98HkGO37z1EH+9K5u1e7HIfGwBqKSNmdcsySpevbrv4K
 e2HLOMj3QN+5S5swje2G4A1VWWKR1hIsVnM8ZB0iW1xOTGZkBmwe4rpJIAi9BLJwjHbLthQOsAb
 ERgLHGqlx+efKP07J7oJmO7ayNcILgegDOcN90uCGagM9EAIno4XAMfSwxkJqEvaGD5Qnhv+MO2
 ZY3nSXfVy/YS4fYDz7UpMRS+ZrF4IPIFJIcJcThcHwA28XDCqncC5XL+DtEJzIIa40xbAbcoGyU
 AJ9XNgJlnXvESaEPdhKCNZdld95YtCnls6Lbtco9Q93MHJP9qNGuKtSix60RL1UihZiZnj36Kwr
 5t3Rv3qZjU7e6nqC32o+zroUDIa6/3o02ygdy+qJddDfsQgJkr3K3loDW+AKr6tVgwBdJ10y5Kb
 nG9AAqEtZF0bSUImwOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020009

On Sun, Nov 01, 2026 at 09:28:41PM +0100, Krzysztof Kozlowski wrote:
> On 31/10/2026 14:10, Shawn Guo wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > Document the SA8255p SoC and its reference board: sa8255p-ride.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Drop. Binding cannot be tested other than build process.

Ok, will do. I thought dt_binding_check could be part of the test.

Shawn
