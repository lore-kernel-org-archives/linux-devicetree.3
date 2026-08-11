Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A65220698
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786415123; cv=none; b=d/w5XJkVPrNNYW5yV3LVnNCg24BfM9T3CFJhoCLdS4syWZJlmzC/Owwzug72GIrGQl/gR8nNS6ZRtTV+yKZGjNe29+Tt9Bjgy3jjdXH9U4ucPzOUvELF3VPKefyUUjAzbtVnmGWprAiKEy2nxn1+H5lhNSYhuQr8tNHKF6hjn7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786415123; c=relaxed/simple;
	bh=SRU/RfpB+1fZ79mr+7JyftulpvMbC/mM4H+kH5o3agY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZZBAL5/+nub1+++PBIVf5uxDmrOQJduseeW2vyn+LZjVRNYdtLKxGE2CAtf7KhHA9bkWZ5dmJ6lOv9VDghKBrPYVedR3g/e13rk7OBufBudZVIbEaHeo90QAFFvqPMh7xKLokNNqGNOxAag4ftcmsGBkCYiHb+IfzQO6lEohXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX1NWLjJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SIG8nern; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX1NWLjJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SIG8nern"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMqHgX3048467
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZlAmx41l+Z0wevtJKQosZFy
	ZSbNZXhxswy5WZuDcYY=; b=RX1NWLjJqnX3HjpwVh2RPKKh7pOHj8Pz3FKkg8eb
	s8vncGVpuNIm+LJbzF6iEubxZNcg4G9XvQ86DNWHREIIZswybwxSuh7ju/m5ueXd
	Jdfa6LmI/SIbBy9aS35uD3BedyLEo/2yHYbHwlitt/g0tsWNhj9SARZ5v2aYaKkx
	Kj1ZIlXc2KExvqKkc67G14TkMZXwbJ6doV8lRSfv1nC4bPyH8N6RIEmUCqaOUqU3
	Cuc0nlqBAXEa9ZW39MAMy74Ni+beEHfQ7ZWc0SoILiJGN5xAGI2yKYqLEDLOaqhj
	zyVxTXSl9hHZ2+bNxlEmBhlzYI4HYX6yixZDodLYb7yk/w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk22115-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 02:25:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso238315785a.0
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786415120; x=1787019920; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lZlAmx41l+Z0wevtJKQosZFyZSbNZXhxswy5WZuDcYY=;
        b=SIG8nernmrUhn4w8hOfsqE2ba44yio+1maU3eknp0UaqopHMbChAo+xJpdExLOTP1w
         zlAud8TJ1ypspYe6dGs2vRrCp+CrO/ntbn5zyvT+P6Hd+FyjhE35aRoyV+JcFjaRafWD
         VC6W09HQOErJApEG+UaQnTrx+b0OaBauQoVN0h/AzTv6bBx/2Mza0rmS385RgowasqK1
         u+f3vq0Tkj1QZekhkb5aiIwHmWOCHehLIw9Rbw/4qbOsZ3Zf8/0PkCJRln+ZcEefhCYj
         kG6JhtHcgp7zFHGHLMkW+86cvSIaQM0i5rZs5uwrrQzLJB5wBcaQC3Fp+D94goQylU2n
         k89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786415120; x=1787019920;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lZlAmx41l+Z0wevtJKQosZFyZSbNZXhxswy5WZuDcYY=;
        b=htTL6Bw2ia9LIkicM8TTGzjdP4rUJKm+YCOT8qan8acsL7OOMvxqxkcwbkKkTMFCsf
         sH9vW0v75t6t/ffAkEVRWnx6/hAd/NzU/TqsTsFqK7QNHwC1/zP0LG992b540DFYkYiL
         ONEzQBrd7pf6W/XQ7HPBy2QJM0ALWwY21rnHh2a108bo7oTaSC6IOHCuF/vAihX9v3dQ
         8KHyJsGeIXBFpIVO6dYd0wSGeP9FuV36kxvnJXURALSrxqc6k/vLCMe+0ItWdxXTrSfa
         lzL7VrTfPSwoMA31KGhCpZ1TTwYvtDAXlrEsDBuDyjGxetpcN1kmb6Yebs4AfXadtWRx
         lz8g==
X-Forwarded-Encrypted: i=1; AHgh+RpcINJUYfEKRzryM9Bo3JcXJYG7rdunAEdIy4SMf3LHEKVPfnPhm+jVAFHM0EsKgw/tydx8+59G9HmN@vger.kernel.org
X-Gm-Message-State: AOJu0YzLwPZOC89OvHrv3KsYtyLbIvbEGRx0VB4INgIiOCSM/vMUIMN0
	9aSj2rosR/lMZ1dKIWz1Tq6Fn/7sehA1q59DZ3AqFl+UpJoAMHJ5G83ygY4irIwoPRBrcwoC+Gl
	5EUCScaOQYl0GBOtOJ/jNVtf6QFSOd6S0+WtZDA9s4UuXcNGij5Wm+J0eq9OzqHu8
X-Gm-Gg: AR+sD11TAse9JzCcuR1sj9rszOjmdt2Ks1OYFEScQ+ZJ4qwtZdRrqi3T2wifUXbsSbD
	V1WyLeMFOblYk+5DRlwMG3EOzeSLuBYiB1mljfDPxZSYXLi4LftUjXjdFXGgY6mxT6yB91SDXDh
	vpWQUBh0tZL6VqpL+TPIgGf4WgSANqE/xKU19dRAPEMspnz8HfKy2CD1jsSAhPUzo//9MhGQLD2
	o9b8hZLo2sl3fNORO6HYEBpcknQWS7KAACboEL6sL7UoFFgXAv6evRQUMfJ+BLNrxL0QxmqBg9g
	zW1JUOxYx+OhimOjVApTXKly9x0ur/6eNSqAk7i0jg4Uj4souFB6ytejv/gEGN/p1DxEvBAs+Tr
	8OIn80toSQc82PnIVSMiODl5o0ervup60MgoDwkR6qX703KgzMfDnxwdc0z3PnVUAr5UdDPDOB/
	loIOQuSvmUZy0xZA==
X-Received: by 2002:a05:622a:17cd:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d58620b0cmr1248561cf.31.1786415120390;
        Mon, 10 Aug 2026 19:25:20 -0700 (PDT)
X-Received: by 2002:a05:622a:17cd:b0:52d:3352:f7bc with SMTP id d75a77b69052e-52d58620b0cmr1248211cf.31.1786415119968;
        Mon, 10 Aug 2026 19:25:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fdda80e00sm27145951fa.9.2026.08.10.19.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 19:25:17 -0700 (PDT)
Date: Tue, 11 Aug 2026 05:25:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] clk: qcom: nwgcc-nord: Add video axi clock resets
 for Nord
Message-ID: <5xlwfx2n2tembxkynxeoyphvaxqnctwmg22x372y2rvgcvo3n7@ihmxokmircjg>
References: <20260801-nord_videocc_camcc-v2-0-674d7718e41f@oss.qualcomm.com>
 <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-nord_videocc_camcc-v2-2-674d7718e41f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX1/D0zXWT8ke+
 4fC8oppzQgYeaUZ0GXJEKuLVqg7Lpxja7rcUdLyAB5Oui4JjeAvdpfVdX2aWqsHQuHNSvXzH1+T
 i3wVkZxX1IqjZJdGPZQdyMk2piBWJ30=
X-Proofpoint-GUID: 3XsVEm-YAAW5BmXgdbDugpSkD9Zvi6lG
X-Proofpoint-ORIG-GUID: 3XsVEm-YAAW5BmXgdbDugpSkD9Zvi6lG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDAxNyBTYWx0ZWRfX4NmNKKVKLHXF
 AIqDEQP1hHTHDpHj/lZtVk18SZC7tdn84gak2jLMsKpausUUwF2igjR3J31PEh0XLJ2E1zq0rmQ
 tKaT5tlQcr94fdGWJbGRMJ66TJwMS2rDY+HD9FNwObyMNiAZmu5RT8ARq6p2ELXrdX9GGLw7xP4
 YYRjHY1reP50aY2h+trV2KHPZVWIhQfdWwEIPxFQI1WNB74ojopmGdhgCqxT62i6MveLlnbvS6E
 EpqOCvqBLUH8dTmD+oMhj1yg9nNIrt+LNYciuOzXmvDO9nTHEk54L3oU/iy8bzwgVA1gfDfVq5C
 1MwWa54onKrLbtafMjOCARCBYewNo/I1RIQR9I0Rfgm0sEfMi+3xVp5F169rBvVeuaMLS+8UOpC
 sHyxrA2lnvF7geXN9FUTUEGlW4SgCeuewpFXsyAECT2BTc+/ueenWXVTWrhO0mIrzBppzSqTEZs
 h7R9SN0uKwi6b/aphMw==
X-Authority-Analysis: v=2.4 cv=eJ4jSnp1 c=1 sm=1 tr=0 ts=6a7a8811 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=-zE5Bsz_LXmV53O_SacA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110017

On Sat, Aug 01, 2026 at 07:43:53PM +0530, Taniya Das wrote:
> The global clock controller video axi reset clocks are required by
> the video SW driver to assert and deassert the clock resets during
> their power down sequence. Hence add these clock resets.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/nwgcc-nord.c | 3 +++
>  1 file changed, 3 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
