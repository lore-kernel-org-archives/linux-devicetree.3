Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841A83B0ADC
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787729631; cv=none; b=X+ccgj5wQDd0GA79OlZB0gZeXGu4rTdT51xKZ06qIgCnMwaJsV22tB+/APpBFMDNedKgqjxpk1V/fetqqaAhqoD5R84yPy4odH0aN3IjRwlaxaDChRpvks0QQw23OdN6aSgDYlx8sSfMP05PpCDYroIl0srtSVHTiCIG4z9UzB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787729631; c=relaxed/simple;
	bh=8kPZvBO340xns4CP9VY5wrGpBmxirmg0KvjLfFXDGiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g60gbffEJHcB6Z3sRBmnS9SIWbjLJGQR1wworBMtq3OWrochAVH5vouR0LrwjQtV81hC7bKG71/dbybtnr87OESgpsH4L2Bx9MfrmGfDgc63H1NRqxZhhQtSRVtiido6mwCq35uUkWf6LW4j9dQnLXo+RUOhtlqFLM0OGd7PUbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfhvB+n9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXNweUAi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfhvB+n9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXNweUAi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6Rk2f3783807
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=m7+teW33YtH3vS4NveYRxOW9
	xtK2h1OQ/WdzF2P2HbE=; b=mfhvB+n9cwA0XB/eGOR2w+nY3Wb29hVGgIs3nhl+
	a/0L6e3YriC5Ijwhqz6bLIaqs/KnvW0A6gx7NI4HkkidvF/wQnl7B3E0ady1IfEU
	8RvBMCrsRuu4znqvQICK8I95Uo57S18QxdOYVEPKjXMp7EB+SufXwwOl0u19QNpa
	Vt5IiFJ+m7Jq8LqsR8ePGvZ3YFnXQYh2cWYtqKv6ojqhwRym/K+xpG9702Kefce8
	v0D0/nJMQ0tzUcvbxQlv8MjRQEhmwVhASoM9P/qQKfZPm/Fcx4GzVA58dOhcX7gT
	r5BVpRWFY18PxcvJwczQYoIfbBpcywRBt/2dqN7M2O3HDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g8nww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 07:33:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so105393885a.2
        for <devicetree@vger.kernel.org>; Wed, 26 Aug 2026 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787729628; x=1788334428; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m7+teW33YtH3vS4NveYRxOW9xtK2h1OQ/WdzF2P2HbE=;
        b=IXNweUAic+O0wSgHfjZkG/Zn+NKYcrCHh+DHE0BKLJrCroZEhzHjT+m/UuD/VkQQbn
         j9mj+SxMTNOGvjjRvg8yViYjbRu25bzb7OKom2jS1HtU9aRdPGr2yVt+9PTmQl3eSPoA
         WqE4YN6S8P8VmCQ0aoLqG/CQIlVjMcrdY+8wJmoTN/hqLWCNM/xoCVcN8M25+Xguh8ZI
         efMFbn5wn4MkrU2UdA14UqNBuM9TAE//liSAUTjpXQ/NMxriiQz/U7iLV/0D00T8MwtL
         dv/PK1RnjSSYHC90mI8mjYgJeO8FI8iSGsVXQs8CoIAUvDFZeqkIqBR9+sxrB9Sr3nba
         rPBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787729628; x=1788334428;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m7+teW33YtH3vS4NveYRxOW9xtK2h1OQ/WdzF2P2HbE=;
        b=ZFkgplF5dE8snYcZCOV1xy88Ylal0UhEEfg5EHpiXukKn7Ua7JddzxdOvRlkxmbYIo
         5xQMace+Xp+/P1N9eIllVAl3K+5Fou7A/1/xbtByzSyey3QgQJGXu3EvDg6FV2mvq2Wd
         QPOYRi7xDwqoVmlghdanb8it5O02qiyPECbMSfopy+4nHoEQwBumbYPl4ofQeoFWtylg
         CgoCu47LDWAMuoy6fFZG1PCpl6EZPaT4WR+/Qj58U3mzPefLsw3dlMhHZPYVy0qEyrww
         n6r/WnqlZX5bNfBt6VzwyTiJYsgW/UlrmWm3hEVoSc7GlVv4HR5iq9eP1vUEHErSCPPX
         EykA==
X-Forwarded-Encrypted: i=1; AHgh+RpF8dV/TZDg0lhAP4nEQnFH+MXjmj2OdSlo7ok6arOBhvuBOiIzz9l8SLkySXgHnRDCX3lCfN+Py7Xl@vger.kernel.org
X-Gm-Message-State: AFuF++m3sZeTrwdK96aejj5TS1zDTX8jmW1wx2ddiNJPky5MGuYqwTpp
	fEqOgr7NCjlNAYMBuNJ06IlQeSv9rzoR2QKl3ruWmQuCFwqRnAS1aM3J44JuGUnyQP6QYCLBN84
	6CoCcBb2PNqLFJbTx9rLQaMJL9zRuWyHjM72WsmWAT05Sb56CeH3b0/iK299L953w
X-Gm-Gg: AR+sD13DpcGi4AWKHQcqb3TOCMm0gqvuyPdWHfP0xJbCl3Ft8IyexBlI/c9L0IcEjzf
	OIYpgh60Y01hyIh+LaZujtA9QUhws2G6sP/1GdZW0Hlzc/mYFtkW45+ySZO9NClhXJgMp0aL0Ip
	49Il3ICc/1mEOZdh50uIz0bV8wCYp1kLP74vjxfLs3qCZctChneWiCgSDbzw0pV2wUb++GRQS9f
	3hDNHlGmzm77bD+0nn6a6ek9tj3WcAGMA4btUnO2kDX4w5vSeEhXXTtvDlWQ6ZxT7oJeML6dcGz
	nnvkbQ+/iTaC1CGKTbhkImzdi6gxPeDNezzS9avMNm3oeZIZFq1EwQVt+uor6/uh0O3OUngghML
	MLAqQc4WzMqUi
X-Received: by 2002:a05:622a:394:b0:51c:1006:a024 with SMTP id d75a77b69052e-52e4247fccbmr39043951cf.43.1787729627664;
        Wed, 26 Aug 2026 00:33:47 -0700 (PDT)
X-Received: by 2002:a05:622a:394:b0:51c:1006:a024 with SMTP id d75a77b69052e-52e4247fccbmr39043431cf.43.1787729626932;
        Wed, 26 Aug 2026 00:33:46 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a5d647dsm327339166b.13.2026.08.26.00.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 00:33:45 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:33:42 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Subject: Re: [PATCH v3 0/3] clk: qcom: gcc-glymur: Tie the CX power domain to
 controller
Message-ID: <vzd25hldomvwelwiijjnmhbec7zicyvzqdpcc37nyjrmmdkfvq@vxylsjp4yazi>
References: <20260715-glymur-fix-gcc-cx-scaling-v3-0-72eb5adad156@oss.qualcomm.com>
 <9a3b9b76-abb0-47a5-ada6-cd0a576b0782@oss.qualcomm.com>
 <3df2f139-bc7a-403f-bece-7e820b202bd1@oss.qualcomm.com>
 <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <xmhintkzkhqbneo2edosyqaxznb2e7sak6oshydtvq5q4qctvb@7axbwfxghvky>
X-Proofpoint-GUID: Hsr6U1oX_3DoLpGxLfio6uk0X5-9qwtD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MSBTYWx0ZWRfX9dgTGtoaS0RJ
 YPogFn9CdcFREzgoZk6hbx8Qn6oqauc1G2EREAxvs3GR1QyT+x38tJ+dTJi/d5e6VeFOladKJ2j
 xBt1zlLyFXCOSrL0QfbWNc0vyyFE6MpzcCEO6OuUHUaKuRuxnT6/sfNGJgnZ9ZtjUBj0b3lTFU6
 3apgTaf6cHslhcvHIQrRY/dwA5fG8EGsaceVK5Fy6tBTDWTzsUrmC7ZkhXCHefBEAbbnIZBLiOW
 AX2+FkPrgCN1PhaRqltT+sW2e9mj9pfdi2JXXRVBM9BkAoRRtlVcVrRYDx1qMR6MgxlPNhNG4Fo
 /cKEem2K+QZW9McMezNYRt/ueuCDMUSCgJD4bzQ77loF0Xuwn8qCSVuH3CnlKTNrdW4D+YG2kTE
 ExrTXyNCxtDqBuKi6CBewPc+JQ9vp6Hdq2yZ63QT35utQSWt5cMkJ1Mr0xsu6CBCAHfuO6yLVy7
 oR9m7VzeFhc/H82XdYA==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8e96dc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=vkuWnLlI3icQtIAv_MEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MSBTYWx0ZWRfXxwS2IsQgYGFm
 gvZcFszuG3HxFbSeN5/crz77awE2sPzMn1niI/VC6d25iymAa2Ujeo1I4BepKPBdcXKaK5VAhm+
 NvPjhkP2wtY1x0DNoh3TDxykDQ0XncU=
X-Proofpoint-ORIG-GUID: Hsr6U1oX_3DoLpGxLfio6uk0X5-9qwtD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260061

On 26-08-25 18:37:53, Abel Vesa wrote:
> On 26-08-17 12:10:06, Konrad Dybcio wrote:
> > On 8/14/26 8:30 AM, Pankaj Patil wrote:
> > > On 7/15/2026 6:59 PM, Abel Vesa wrote:
> > >> The suggestion of having the CX power domain tied up to the GCC
> > >> controller started here:
> > >>
> > >> https://lore.kernel.org/lkml/fe210f0b-692b-4c45-afc4-fc2bc5e57854@oss.qualcomm.com/
> > >>
> > >> and then, for Glymur, it has been brought up here as well:
> > >>
> > >> https://lore.kernel.org/all/0248dc51-1036-426c-b1de-dbc71696e2c1@oss.qualcomm.com/
> > >>
> > >> These plus a discussion off-list led to this patchset being done.
> > >>
> > > 
> > > This series prevents cx collapse during suspend on recent linux-next tag: next-20260806
> > > Reproducible on latest tag next-20260813 as well
> > 
> > Yes and the ""fix"" is to disable the GPU nodes because the custom
> > runtime pm dance done in the gxclkctl driver keeps a vote online
> > 
> 
> Actually, what happens is that a sync_state dependency is never met.
> 
> GMU doesn't sync state because there is no driver to bind to. No driver,
> no sync_state.
> 
> Then GPUCC doesn't sync_state because of GMU.
> 
> Then GCC doesn't sync_state because of GPUCC.
> 
> Forcing sync_state with timeout, allows the GCC to drop the vote on CX.
> 
> This is not only a problem for Glymur. I have the same issue on Hamoa
> (XPS 13). I'm almost sure this is going to be a problem for all
> platforms.
> 
> I'm looking into possible ways to get the GMU to sync_state.

This does exactly that:

https://lore.kernel.org/all/20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com/#t
