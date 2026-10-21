Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601773;
	b=F0838nyO1oyw5iuzKb4rgYw3IXAgmidJ1XvxwKbpIhBWhHw3qLqkLcofeEqK1UtYh70D
	 wK7rWLYC7aCt18z/w5Eghw2K4cliSKqJ/TlssP4JfyyA8BP6bIcjWcrtNwFduK1WohlwF
	 RA0c4IE31lEpKULz9FU4i5QDu6uJdtoRy6st1XJEQRecGpROC3kq17tUVNxnjuaU/cOC4
	 aQlI0sTLxiZj9Ks3jP7+nzh03Y4buTaPFuQDdGv86N7zlO4g889AEMqR8967MVU3iLL51
	 YyxjolcsqD8/0QddNNEISZozpbEqqseRvie692/cVg2Um5WigI+v/5tvLkGt8+a4eRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601773;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
	b=2DNZ/PYUA+sLHyEdU77GZc9z9/laKolGg+beKmGV+dqq31bvG1/AVhqS78JRvBUyaWLm
	 r/fif9FLfh+TJXiC02eH+3Uq0zldXj7Jwgnvgxe5tpWxyxVJiB3AbZxVDPv+tzigHr4ks
	 yW8RU8gdTte137nvdUmxJG6mIz6Ln2n0j2oa3vRPLbXyfkwzfNDHqaBIk1kzFWMyRfkMp
	 qsnhYBVJzxbtKbqEMomulm3YsvihH00bdm6VNcXKZe0W07NYydgC5sTnluL22wvTUcJzL
	 A+C5BEYdkxLP9Nbd0NgijP8Bo7dtL+Qbo1iLS9Z+Se6ND+9T5enrgD+UpZDEcNTachw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8C460A4AC5
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D8C460A4AC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dbfgYAmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cYuRoPmf
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LGL2Uf1105617
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U1odT0h545fjjEeb0UTVDvE0
	Tg7Aw5T2oDxzlxF0X4Q=; b=dbfgYAmUPR83D3MquXGFpWnp/Wrxo0tk3rIRxDpS
	ORZg7yNiKLtu40ncUtPzayfksX2qdpSYPEbC7mAtRvt6V1NguSsQD1kLwjH/54OH
	gXxeTx3s9cIzc1PVS2iED6SR2b7VyhNoc7Db1XjQde5WmmfCpFiNTdzTmHMwge45
	UDNUHFy13zGTOYJdadWx2R/o122ddPVokeWQYByBbJqzvFyVB1MxHrO3xIZ3qw+Z
	rxIFrMV00H5uz/KfE63V6Iomz2AFOvoTVhccJGK2V+EO8ZX6LyUv2o+J/wpxP4vV
	vR8uZ/PASeh2aQyYlX+1wOP4HgcX7oBIU75bgQM0EvY9+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heh5r45rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 16:56:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so210376285a.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792601771; x=1793206571; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=cYuRoPmf0X9XqOhph4XOfPKDZySeuyRhOCMvZ6glNlMBVeqd+eamYW8FTjVNSOYFC5
         lptHqWdprO7FvoiHgOvgTCAHVrpMQR480LdxEf6fr4JFdr+ze7DDccketXdvxhXTHeu9
         tpJ+VOKJ06uZTCmd2vVx+guEjwXiMLEFUttASnHlVUEhgiVsbqWEdFJjCjN7rslJZtH/
         jomUv3a+JIp98mdvJFHCilcWp1yy9ID65YRqlHiGMhIr6NXgLORXKgpFTH1fVqSLBkFA
         NKUjTtCTY24KNq1/tNfmM6U/zOTeZdz/HAt6/t8yhxmcE3/43tKGuD+X0NIdJ+cWRnrN
         w4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601771; x=1793206571;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U1odT0h545fjjEeb0UTVDvE0Tg7Aw5T2oDxzlxF0X4Q=;
        b=LZTu9X+rbQ5SzuWUDplY7tr3Elt0j5GMDiqRdR+j+wGzsYHLlj1s50enZuGX6zOh4r
         zW6VNceQ4ELX1W1yTBZ6+4Z3LlpH3Azcmxb2xPQuozFc9v2Xqyttg20Kfq82HbQq1BWY
         LvHc+o2yrqAzBcenZvUc/bz/z4FlKCQKe8OkaBtMwJgPYie9UH4RXSE21GAx7MnfHTbA
         E136NhK7HnpemigetjmMW2Esb2oKHMJDRsE5tOOHVEwtSw9Knauoy/qkW22Z/EdHHjyy
         mjAMb/Zz2+ire8K5PBRGSFcPJ8KbP+X6WssC6N+HvIeTjaI1QVbORj3T1gf+8FaDzTR/
         GpXw==
X-Forwarded-Encrypted: i=1; AKwUvByQFMmv7nyAQz1kdJEJyM3vh7tPOwjAbMh1kSciwKVO40D6ecXOmM96jEkOkMhTjFW9UmDGMOJ6egJm@vger.kernel.org
X-Gm-Message-State: AFq9FYK6G/iJIdXqrbNTnmFq7bpmITtOG2WeVZsMLXSo5yWfY8vyasT9
	VJWCx9oDJvLGECVJIV++vQSUWT9CZvx8pao/RsxviyiE8mih6aknAceaIFKGj9sNm+OSS6XYOni
	fWMn2BR8G3oQlNn4Khad6nQIt6/UA+po2BLpJSDiwTZZN6FOlvRF5wW2SbTK5HOqz
X-Gm-Gg: AYBFou2CBGxTMq3iYkg0o7+R3xUcfST2JyHJ+xWXus2kp4PJ+MBRjPZ5PJ3BDo+RBjk
	wYQT2wfkerQOumFBOcIlKq4s7FRlx05KZudJWE1Cmp64D/2+r5HDqDqj4rn96kYsSN+dn08RBsy
	kOI4H/D7Cg6EObrTXZh6rWoYb5jZidU1DJ7Bt20ZkHwD/leLWpjTJ++hFlumYCntRZfG8mULWWv
	fdchR4EgQaUnn7SYJs2k4WobWWsMPy6lmdtAvzXVjACuBcprQdbH/nb6wnboqZIUArTKVElVtd/
	G5ieTkoGZv7Wop0I5Oa+Iabor1J6qDTYN8YMBrmSf8CYqsHI785r/8rVuCBT6+DO4If+vwzQqYH
	73VP8J/4iPm4R//MUCrQ/sQse+wjF8/vQLxQc0FiIYP2Jut9LWqu1AS44N/1xTGHxDxgPp/tWPG
	8amRHnzuIskoVG
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536574285a.79.1792601771327;
        Wed, 21 Oct 2026 09:56:11 -0700 (PDT)
X-Received: by 2002:a05:620a:31a9:b0:93f:1445:82a5 with SMTP id af79cd13be357-93f57f7a432mr536568985a.79.1792601770867;
        Wed, 21 Oct 2026 09:56:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa124187fsm640279e87.78.2026.10.21.09.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:56:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 19:56:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] Add Qualcomm's IPQ9650 APSS Clock Driver Support
Message-ID: <3v5ul4b2qddghhwdyzbjh5uqwo6bvghrabr4nzs3ttvxpcwfne@tyepx5pz3tqv>
References: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
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
In-Reply-To: <20261007-ipq9650_apss_clk-v1-0-fd4c2b3cbdea@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aI5lOr9m c=1 sm=1 tr=0 ts=6ad8eeab cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=slmPpXlptjOQBmdJfhgA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: dV12KboqjLAbh2r8VAaG_ekqII7cZU1i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXwjSf90BtNiP/
 Mh/7Za7EXESK9Od8idNLFdqeYus3HVwqjO1ImDurrENexGLueNvsPXTnv2Nx0r3he0x40y/PgEX
 UJvsyic2kckpHE7YQaZQOLNF6MspW6UPbwMGNiTrJeBMnSnlQ3bE/7aP6NL9WB7x5zT1tEY+Qj4
 0DXgBC0dbu5vyLrFzL34eRStRqog8+gJiuE7IOnATEQQnCteAoll4vZ6Xzfi5SdE1tCUg1mjAYj
 6qaqJ0lq8ltYD2PyNwwyqDJNBQtKhbWZi/54vCQJlxHTj9K2PfjM4tzOuPIF8a0EdQG6rj7ofYR
 RvyDoyvlhrf399keT13e+vDTAnTcZr7HXFJC4XoGf50WC8w7vuR3+0zkRN2whw1KZQG1KSjODmg
 SDAJGZoRznwWBc6sPMQeCpe9AwMetnVYaF1JcvZycekDncLxSeD9CLR0nuUKkrOvqsRcvGnrJXi
 L0VFRIlRjYGPTQfch/A==
X-Proofpoint-GUID: dV12KboqjLAbh2r8VAaG_ekqII7cZU1i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX/LxF4VnTAziF
 XJbqhh5K+P2/iKO9kHnPltW6KyqKHo/glAPj5L6iePYfcwgQBNuWQdFUVaa/++npjofF7KjpQ+N
 SUweQ3g3OHVtBy9iWDQq0+QDx/1Q/WQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067

On Wed, Oct 07, 2026 at 12:20:43PM +0530, Kathiravan Thirumoorthy wrote:
> The APSS clock controller on IPQ9650 provides the CPU and L3 clocks. The
> four Cortex-A55 cores (silver), the Cortex-A78 core (gold) and the L3
> are each clocked by their own Zonda PLL, selected through a glitch-free mux
> whose parents are XO, GPLL0 and the corresponding PLL. Since the L3 has
> to scale along with the CPUs, the controller also registers an icc-clk
> provider in which both CPU clusters vote on the L3 clock.

Is there a complete picture somewhere? Do you have a DT implementing
CPUfreq somewhere? It might be worth including it in the next iteration
of the series.

> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
> Kathiravan Thirumoorthy (4):
>       interconnect: icc-clk: support N:1 master-to-slave topology
>       clk: qcom: clk-alpha-pll: Skip Zonda PLL configuration if already enabled
>       dt-bindings: clock: ipq9650-apss-clk: Add IPQ9650 apss clock controller
>       clk: qcom: apss-ipq9650: Add IPQ9650 APSS clock controller driver
> 

-- 
With best wishes
Dmitry
