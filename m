Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A033509B
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787071; cv=none; b=enpJb/+6xG09GkGwkuiAnOVXJCZmdb1ajDKRcD5SCiUkWUxFsAek0LDy5sI3luftX7kVwRq26wGTyOD546kqEvCY80zc1voVhAM7HS1pcxvbQdIhazqgvhBaKiWo3vXGn9L1xFg0Z2eUtnjEw3/zg0UAfwYZ9UZjbCAxcKZ5QN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787071; c=relaxed/simple;
	bh=73XcjV9bXO4RPERKoq87ZwIqnfQP4Ht816lp6dRQ2RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qeuWt4boZuTnZ8zzUlmsXcgHQjIorot0g3Uao7LAR25ADKPkuvvy9pA5omjwE0SfNp8HTsIB0/TRlA7nCsunMtfXJ/884ssxHhqJPECUd4iuzt8NJ6DyC7WRgYzWM2evlvCyOHO3a5S9uXibx6Uj15Fr5EaKEocbPOHDh09IUmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L+0vi4R6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIM2tLky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L+0vi4R6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jIM2tLky"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55ofm751193
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:37:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qzD2ofBbH48sX7SGVfDMPXA7
	lQQucAWBhVFrsmWjP0I=; b=L+0vi4R6Fud73p4TkzI+lHBHxUCIGO5Coal5J0C3
	95KBmUaDxvcatOEQNmUU5VGC0ZqlvA2Z3uKYX/9vWzo7sQmKH1dW0lN553xOtS7Z
	r7Gly3K0SalD0CPfBnqLrFqjhFEpyeQIqws4ZgfdW2fzJIcb6agbWYvA9bRXHzNK
	N4L2U0mo8HUO59u05JLtCmkmiMzzZXrCYSNpr/G3a7Mo+wtj0guZJ0awpOS7oMnP
	xFdSq8O1u/ZYO9RcmNcnyekHUcVhuuZfNMVBiOGWBYewbGQL3a7EkhGerwT0duWX
	fDQGk549s8aHx6MhwViQNMigvmXVHbBkmtVSQ9KpJvYx+A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4ed1f6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 06:37:49 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88be38f3a0eso269105b3a.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 23:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787069; x=1792391869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qzD2ofBbH48sX7SGVfDMPXA7lQQucAWBhVFrsmWjP0I=;
        b=jIM2tLkyZNg+m9/3JnWwNgcGEmKQxDR6MBcLdBMBiAOl8qIqS00XhPhT21+rQeRaRn
         Mz5gIpxmdGZZwUpVi/sRwsiv38PV26pmC1wBwVjBIkPB0XOyYEkfYE7vBwoQwrwGsXtf
         0R4DoAh6tQ81/lTdOd5Jgr3D3u1yl7ZtjdMhtXCBV18oY3vZfth/kg9fKVzZ+7H5aVwA
         ere7V4pyTTMQEh3zKC7T7UBOjh1A0nNs9qOETJAesvSHsAAdhOUV+2n3eabIRE9rI9/8
         p0K1s6Ye2+nuU2NnrdKXpfQeDJYfaE0E8zpNiUQjW1nnrgWVeP9zBPTQD9vb27cGa+zJ
         CZ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787069; x=1792391869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qzD2ofBbH48sX7SGVfDMPXA7lQQucAWBhVFrsmWjP0I=;
        b=yDnvyyybRWa/wo2iNIh493blR3nFPomhut2blYNZKsXe8TUq97EI+rhm0khdJAuW/T
         heojkOjt8EEDEkCLlhD8CX/HJX7J41IIE1UrYSO7qC5KAKFSo91tuRIU8p5+r4tEqrxu
         HG6ulnG/Sd5k6JsPcXtkVHtlLKS7sZzxZtH4mKyQm3hvSvMiIBR7rLTKpj2im8p1q+ik
         zaLqc1/igI2QjBqj3c/VwiexTlqVYphIru8xHlvDiUkb6IyuHndSCU7OM6uNEhQZ8Etp
         AWx3ftH3FrT1H2YnsFO2R26BOaNXVNatF8Ps3E8uj9C4kD3P4/pb6fyi31h7VN/bL6gF
         ZdXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzdX8Zjqsi2QvxJu7wrwg5hDK6xdw1/vBzwGrxg3LuO38ehmsZ9X2tLLMXn6J7OgX9OmYkorLyD55Bm@vger.kernel.org
X-Gm-Message-State: AFq9FYIpk9go/EAlk9EJE0NcYbg3F2QbWMZy5EoiY3dYkVKdWP9Myn7S
	nrUOXZwPJAqVR+xOahEeQDZUAlJfLTO3sF+htcFdRon3Uu/evbOavxYmJlsSFyI7H7Hlz/nICE2
	tzdp9LEovJcYiZ1pfynVLzbVgOZIRqD8rpT2te92xKH+RGOfZKR+ypIKL7Bk8KicQ
X-Gm-Gg: AYBFou3OzjvU9TnaJLCX0eS1fl/VSRmdJg6yv+V+JeBP05QmfDMOx+CSHGmtLuAOUjI
	lk5lqkAgTQb8FCkQlILaN3eYdwK0f4tOzJfCgmk8kpU30Kj35iQtL8T1FCWrjZ1RnLVKCZSqvTt
	/nGXlOjlOL+oEkuLTH7XzTyj8FH4Ywlu+GbBnZjUko8Jg22OOxYGhV2GeqNBgptJKmlGIkHFB7j
	+laTNZeYPLYS7MEAoZMmOk0csultYqxUGh2B4iq2gTqjSxRU2EEWu60BmfjyfuvoxEmjIxHXK4G
	hp9dYR9B5Kx0mQYFJo4irtKkqJ0Hp9M+PmrM/74rLXP8LIio5szQd5+EjuQiwwHWsP58ZRPmJoa
	4MWr0a/Q6kbV/2bcDKElyFaoFmDS5ntNQx6bdt5t3JA==
X-Received: by 2002:a05:6a00:3c93:b0:874:705d:f64a with SMTP id d2e1a72fcca58-897c7ad8986mr6262616b3a.44.1791787069068;
        Sun, 11 Oct 2026 23:37:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c93:b0:874:705d:f64a with SMTP id d2e1a72fcca58-897c7ad8986mr6262595b3a.44.1791787068518;
        Sun, 11 Oct 2026 23:37:48 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3ccc67asm3738084b3a.32.2026.10.11.23.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:37:48 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:37:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/5] arm64: dts: qcom: nord: Add PCIe PHY and
 controller nodes
Message-ID: <asyANRr8ac_SD0CG@QCOM-aGQu4IUr3Y>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
 <20260915015632.283642-2-shengchao.guo@oss.qualcomm.com>
 <asmkI-UO5oMtrqsF@QCOM-aGQu4IUr3Y>
 <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <086f87b9-9b9a-4acb-b18c-be37cd6558da@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX+ieN1n/+XPH2
 TePt+HrkcfG23J4GMFse0EuNDKueajrROsS/3ierewCUARYY40/Z/8M0WLZkKFFsd+QOCJiJKmv
 MgEXZ3iVz8IZ9/TdhOQLQW/ls3PRbWEocks4QYXph/JtZE76NNwWIBU3gtUyb8s5l6KMgSTQNa6
 LEbP+0Z7ITbzCyermGVJgq/Wwo8f8dP0a1m/4gbbtEXh8T2pidWQEKuVrgYFx4pwaJEgvGU/ztX
 /8O7t8JFeS+fhAbXuxXa6xvZnh9mpsK8P3bRZ1NRjkEgs7Bxrxu2/hVMAXo/e4SEXrjIN/7FdD2
 utHmCht7/uDUeQqb/sUJlZtKSSDKULeHNLwjNIIyXMHi3v5VxDBm2qa1/EvrkRfcmnFfPHJByYp
 +mU0dvySVr7VE9QUoMqQ2nUyAo2roaOcctbMGtEYUTZswtGS09gBJ/w287gw0orj6FW7H8y90ke
 pVE0WX7A0W98KP2k67w==
X-Proofpoint-ORIG-GUID: YbnkkX4pEdl2N2RNoVP1Ld96t9fcvt7v
X-Proofpoint-GUID: YbnkkX4pEdl2N2RNoVP1Ld96t9fcvt7v
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc803d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=v2e4zakv3qIv4HXwh4oA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX4/j1X7N+1agJ
 3nm6R9vmX1LA+XYjjnF5N48+SxOhLZpBdHSs0DtLwm4wFuAUMnyZBXhXbYMRkQcQ0Qrl5qEHcXt
 C9x7wNE5heAfWVikVl7RhuYx3KujizQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

On Mon, Oct 12, 2026 at 10:52:34AM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 10/10/2026 8:04 AM, Shawn Guo wrote:
> > On Tue, Sep 15, 2026 at 09:56:28AM +0800, Shawn Guo wrote:
> >> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >>
> >> Nord has four PCIe controllers backed by a single quadfurcated Gen5
> >> QMP PHY with four ports (A/B/C/D) and a common PCIe SMMU.  The ports
> >> can be ganged into x16, x8+x8, x8+x4+x4 or x8+x4+x2+x2 topologies; the
> >> topology in effect is selected by firmware through the TCSR link-config
> >> mode register, which the PHY driver reads at probe time.  Describe the
> >> x8+x4+x2+x2 topology, i.e. all four controllers usable, as that is the
> >> configuration the boards ship with.
> >>
> >> Add the controller and SMMU nodes to nord.dtsi, and the PHY node along
> >> with the per-controller clocks, resets, GDSCs, interconnects, OPP tables
> >> and TLMM pin states to nord-embedded.dtsi.  The four PCIe pipe clocks
> >> also become available now, so hook them up as GCC parents in place of
> >> the <0> placeholders.
> >>
> >> The controllers and the PHY are left disabled here and enabled per
> >> board.
> >>
> >> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> >> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> >> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
[...]
> >>  &tlmm {
> >> +	pcie0_default: pcie0-default-state {
> >> +		wake-pins {
> >> +			pins = "gpio0";
> >> +			function = "gpio";
> >> +			drive-strength = <2>;
> >> +			bias-pull-up;
> >> +		};
> >> +
> >> +		clkreq-pins {
> >> +			pins = "gpio1";
> >> +			function = "pcie0_clk_req_n";
> >> +			drive-strength = <2>;
> >> +			bias-pull-up;
> >> +		};
> >> +
> >> +		perst-pins {
> >> +			pins = "gpio2";
> >> +			function = "gpio";
> >> +			drive-strength = <2>;
> >> +			bias-disable;
> >> +		};
> > pcie0_clk_req_n is a SoC level pin function, so it has a good reason to
> > stay here. But wake and perst are board chosen GPIOs. I think they should
> > go to board DTS.
> Shawn, I don't see perst and wake gpios are changing per board, for that
> reason I added them here, but such requirement is coming we can move them to
> board file.

Well, we have only seen Ride and RRD so far. We never know how other Nord
based boards to come will choose the perst and wake GPIOs. This is
simply a board level configuration and should go to board dts.

Shawn
