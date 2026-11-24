Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795536168;
	b=Oe7NbyP7QqxXrSGZ+2E9A0rRCwDHjyVadIw0ZsiHmvgGjuay4mzp78hXII8igU9oYjwm
	 W4ZT64GGmuqzHkqz3MYFMkq/JQI7LtHUXqIzbDEcCGIY2DRPZHqIKSCNceX8Rt5f/3MGz
	 0yUxq9/nnTVgLSwjh9f4kto2yrXpgEsL2m4DUji+GeL6vzdfDRzyzIQZTVQsVmgA8/4m3
	 V/kAbWda3JQB5CY7WdgMRxAObQ1lMLlVrVQUCb1YK4MbxjFTG/TbLj6aIB5UIkaYXdKSn
	 BOPGdxzYIysmfapratnFWUMuxRXuXzT4AILJnCUnekKwZEFK7VqcpwHNVhplph/F/Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795536168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
	b=NTdyPM+SRlQxY9yRol3nEAdvuclrzw8KV9bZwioYxCflIYwtoM1vDy3ItvFITYQ3lNLo
	 PyVaz2ntBsL1IvRGvMCqG6+8VO03Mtxq+a+jMDtdnAs3iaxwyB9ZeLcvIoz/DO67ZqrCt
	 SSCYd8cp9UmItXQ+GOjjcYFYkeWh+LrKBLKQMs/iDAe7RkbL8dLehWbL5ZTIENEN5exJp
	 qFuhaHr6bYcdvwHLb5+st71oWmkixpN5rxOM3hIAuxHChGImyIlv0YBO3GI5IAEbzOsvW
	 GT4Gd/NsdwQVTLU2TIbKbsLrL5x0zLQ3jf4GrSUohdsBxhuToqQrM/I5KTjg7N/g23A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbimFH+s;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6740606A323
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6740606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lvK4NXkZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UbimFH+s
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLKW63267099
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7e5IkpeNb6Jnq3ekR9vD1xEn
	To2vym3AHpRb4B0Ibcc=; b=lvK4NXkZVCfaLQE3CerZ13b8vyja8k2emdEbwSCp
	vHLW4KegKzU+SUm3+j8urcgcUUuE52ETu6NFLJmQjjGSWXEgZp38p9T28Bws03+u
	5SSwEIWJzZuMp71ifrUe28tpmZR6mNHQttxtVY6+hcWVEnuOYFS9wji97Xs9T+Ra
	eeyAzwGirdlPf7dRh8e3GJ1wCudn0AtQiKW2ipvSl6BmEBZ7KYbiKkOaVg6Edj4T
	dCKon/cjBNx4fg4qUtLiz5ZcetPeAT0pwkF76torbJ37iyBgl8MWZeMc+yU8ZC3X
	uLEdmh1BVvA4mlMuVDNiE9xShP59pBVtTmB0UeNpBd7dTA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5ad7s1qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 16:02:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-38355b03cb8so4692284eec.0
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795536165; x=1796140965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=UbimFH+snDESKV4g1/rdj2ph9dB4guSJdosKCagC1VHgKkx/0f1j6t10Am/KlX59ik
         vp3hl8bCCnzpeSldVHikw0i7TzBaW+0JYk+s0HCgzEDRqaIgDI2UvUPlzBCuinr3+iAL
         kX/OB0b7FjylV6lcqBBYU2f0lgqazkyeqJHchfYfOz/t8QMZ1mNM95GHUd1pZVDxpGXn
         ux1tAk6MkLGuZFrHx3cIZTatj8qbgH2SI6FnrkQ/dlw2w+b/T4/rme+h30UhZN8ZYuvq
         ViRarZdJ/fcUWMS6l671WB9ZzI2TBLisd05oq2aChIhR02rmcfD4rPGLx+pUFqGSDWg3
         BTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795536165; x=1796140965;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7e5IkpeNb6Jnq3ekR9vD1xEnTo2vym3AHpRb4B0Ibcc=;
        b=pk5iMfLkpMQ2DixOR4FoA/Cr64LrER/fux3mQ0Iv9M+MuOg1A5zFIR7vupod538zrs
         OuFM6aDTIiqacMypYZSnLg8IfF6QD519FTxdVrhSvYbECJnOP/zqgJ6sveE1V1YCN4CR
         D1gGM+CpDTvCHTtbqa2F9gmRHUfGq8ijanrvcj+Vwz4NJnDY4s0gOD/gS+l7tMeQZ3lC
         4mglXfpV5sveYFPdn/sCGNXCFl0bZ6lTUxYwdMDoDs2xsqgw0XyCjSAwlkxJzRuBDj0d
         4qANyv4DzdjPJYTZMDcjxgbrVrvtFgSiiNo4j6RK8l7EAxee8iMHmgohB1aCkoLAiXyp
         otZQ==
X-Forwarded-Encrypted: i=1; AL+hErHZ1nIFI674HZlDKA2rF1qDmy9lsRp/J2RRL2pcF2WikxsH/HBKguO8ldNXfGobxUHKTUHZVsCVS0mZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9UzlCZaJfRSuo13/eGgO6mAgZSOH1GtzIBRXmoT14fgwWA7cY9
	KN547l8e5zEBtNme46EBx3EImp/pgtqMnOQtBNVWml+gj2kpQfVu/bPzkp5t1IEAyEq94q3Laus
	eVsynNcPpwoFARARaK0Muse6FfIQGydeoEdRdwTtBBXnO0XY1SiCID9PizbgEWn4x6TJVj/R/
X-Gm-Gg: AZFdTZdQFsSZsQP/HfBhUh0yP+m9SRna5fEAjuAIFf2gw3KtflspooZjBOuaoxQZzR4
	HKaNIWfIgsNcvsZLmSz8RNNeRUaJ5Gtb+NkltpUNUm+bTHZcStYOphb9XZyO3qSlcNPH9UONYHI
	9/jh0dgdLXR28cDrjt3vRtsu33+/ozYfFYoey7vPmuoZFleqCHDwMhwLyUJjdwEFLq9QQ54YNo8
	NIHY0PwaYZn0lRckVkbEcI3fRFL25bfsccU3tAbvBA2Nj5lixAoU7vayfINMJc4bBchZHj1+HTR
	e9PtX5+/P4IUo8fxixhzdBko8TnfzzVktnwFSs0k3DkwRCALwZc6EjVXHAYJjb2zbh/osPME4vl
	TJNIqEQavTgXfkFeK/IJNtQ8RTqVw5BdoEeJL+tgOMRIhpROIQhw2Bnkdn9P/DQ==
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168419c88.32.1795536165155;
        Tue, 24 Nov 2026 08:02:45 -0800 (PST)
X-Received: by 2002:a05:7022:3f0d:b0:16c:3408:760b with SMTP id a92af1059eb24-1b5568dabf1mr15168384c88.32.1795536164374;
        Tue, 24 Nov 2026 08:02:44 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm51670984eec.24.2026.11.24.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:02:43 -0800 (PST)
Date: Tue, 24 Nov 2026 21:32:35 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Gopikishan Thawre <gopikishan.thawre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Ajinkya Inchure <ainchure@qti.qualcomm.com>,
        Anuj Tripathi <anuj.tripathi@oss.qualcomm.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Karthik S <karthik.s@oss.qualcomm.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: Add LeMans Draco EVK
 board
Message-ID: <awW1G1Aou/65UZ89@oss.qualcomm.com>
References: <20261123-lemans-draco-final-changes-bringup-v4-0-dbfc15cd0883@oss.qualcomm.com>
 <20261123-lemans-draco-final-changes-bringup-v4-3-dbfc15cd0883@oss.qualcomm.com>
 <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
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
In-Reply-To: <609ea06d-10c5-4727-a9db-8d42e526befb@lunn.ch>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfXxhrK4hmwq3Vp
 TXDUJHgASYaUCzH9Hn9joAsrTVuZnu3/euS0KW2psfpVpnLyU60xjXI8/8gngmnYbxnZt2bUctb
 3hw2ebHBYM3Fvx6198OxdH8fB45Z82s=
X-Authority-Analysis: v=2.4 cv=cI51IVeN c=1 sm=1 tr=0 ts=6b05b526 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=kppLnbNoFjUBNF5CwvgA:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2MiBTYWx0ZWRfX/zZBqg10Dnp5
 v/AhH81xynu6Tu1pvJytYPRhQpPsuosSiS0X3Zj/5iOshAE3I1SYbS1LWc26kg0BwLcARkh/3Uh
 K+mb35ogqaEU9ZEEZo+u2bME4aD9feaZRIJT6jWEZ4zVhO2hJyYgQ5FwhGcuXNXk+WQSa5yWs/F
 9p785tcrA8vzUdiAsV9tI780su5zNApXDOrYlUHyMLT7Qk3AqhwtNuhTTjrrtXDH6pG3m4wTgDh
 c9o/S0qVCjHlH3eJQCVz8LhkwSKWL6QyK5KCGXwmf/eF6y/kzXcms5K2YuqvVuu/Mpdowim2Iq0
 5y4xsZlKlNb0e7A6uSlasQGDWQArUSmntDROLCvyL2fcLTr49z3BmpW3VzZ/Ti5dtMGn7BVf2w2
 OgeGd8QE3Acjg2KoRfEJWdaEERMxckRAiJAyXwVDA/Qfj8Qmz+HDtZYxW/iOY7BWnVxpXWQtU4a
 s98OtYxT7ZnXx/e1o4Q==
X-Proofpoint-ORIG-GUID: UP2Pi77JEkyhz82GB_O4btN9NvCTg_hj
X-Proofpoint-GUID: UP2Pi77JEkyhz82GB_O4btN9NvCTg_hj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611240062

On Mon, Nov 23, 2026 at 09:29:49PM +0100, Andrew Lunn wrote:
> > +&ethernet0 {
> > +	phy-handle = <&hsgmii_phy0>;
> > +	phy-mode = "2500base-x";
> 
> > +		hsgmii_phy0: ethernet-phy@1c {
> 
> Same here. Broken 2500BaseX? Or properly functioning 2500baseX?
> 

Based on my previous experience with Lemans based boards, I think its
the former: overclocked SGMII / broken 2500base-x.

	Ayaan
