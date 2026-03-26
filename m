Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75123E8C41
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774522497; cv=none; b=T2ItsK03UyRbm36gQbOBW+0nVyDEBu9gLSH+qUsqeN4HptpcGXINfRa9uWmOqB+f2TD/xPNbSdHy6E63yNMkoZ7s1nCL9q7ot6g1dR43OhWYM0owQc21R85sw5SZA8XtkPJgIsGPwf63Pg3k5SLs1GEKV7TrCtE9uu/U1d/Y0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774522497; c=relaxed/simple;
	bh=v3ZRDhp2oZJRs8U2iTSL90RVhKSPq+B8LB8nxAFrsRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MRBcQqxuElOhUs19brJ8pxgrhQGCmxQ3vWozPZ5z1gxzdECUEKVot5Wn2igtmB8Ch0FhFTZxAf9MK7qA7dzgN9EGJTb2TvXk+xhbz4PnlJZZfB3s8bJUYCtAw2BL2SBfODv676D7cz19lsTgTtNFLjVnueBeSVeB437+ZbqEqD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=npGZEmkH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F29cA1yB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="npGZEmkH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F29cA1yB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6CXwh141341
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=; b=npGZEmkHTJNDptts
	mNxhz0eAYUSy3kWtR+t/H1NQhrF7ixVuQ+W7xnw+w9QMivmg2kSdAyn85e2ESpTm
	fCkh6rqtciQ/KaVH13PZcPnZnnQ/ANdk8NTaAFfUUp0jZVchrm4KJqWYURIsc8RG
	j1HxY+QNbo4pg06hhzdD4N8Adl1Uhb9py7y1b+e+QcU8SmaWtkXlAL9EOX4kMX89
	dncgDMpXW24LbjgAt2mCismwnWAUagyR54vpETuUdEFBXE6L3qGsPSXznoD3baqw
	9GmUffXvJ/zIECcSaV8YtX80q18923nvKjtzjtTExihBlxxfW4aFg3bxQM+eqpvn
	dozh6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4q092gdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 10:54:55 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b2955cc1eso2338981cf.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 03:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774522494; x=1775127294; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=;
        b=F29cA1yBQUPX0jGvpvA3DBHyEkiv8P+LBOuRvije/SZKxTc0erWRGxfx/1nMKyCGLS
         DNMNrxfBl/n840hnC04eazRkjssrj/fhYA6J0w/xfTOaDLapTPwxlzn/KCQsykCizaPL
         JZ5Xap0ZqWH9VFSEbLQPxbK5Bha8yLHp6mierWScV+6UosO47K0nZm7tKmBUoL1ZPyKC
         vVn5IxcW7dy3gyAiCXLUV+102PFYdB7JUy3sHh0fzI2iewBVhyyWnCIiYT/njrXHVghk
         w1oybsa1GlwnStsJeXQTxrVU5Nf0QRUbFh4e+8QV53tuOM//GQBSgBw+KtCQMLQcUxHQ
         /0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774522494; x=1775127294;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zT4sSYysRwxC31eN1VVca81UgtYXFYInUGnR0rZSPM0=;
        b=mk87ff/P/hP+FeTaacAnmPA3yP+I3DSeLfyIRMQGazg57LZ0jZ3KG67tNN6OeX6Tp/
         T6d0ne/Cps3g5y1SHK/jdCirSW3Z8XBjDYaFLZMbGLjb9PQWEph1u+QGaDwdILmIw6Qw
         rJLB0aLzsQhx7WEQn6axlPlfoxXxo5f8+b96M8u9vkqJgWXJqPXeGTjOxP6gUYA5ND+d
         w3pT13mGCtMXUc+Uj63GmjxKix6sKNNgEsnCN/jDzjYVTzOR6rrDaVGbwBqL3UObGqXe
         3vRULRgSHpjMctGNjjfm/L2G+aXUI6yZushsv+WnL00OJtmlU3ce1nGJQX+KhllyDb3R
         RqQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcYwaSmhraHNEzcp0PJ4OI2YnAHvEmf+y1W9AFcYx7YtIW31BE4JEZ1YtsqChOJOJ4q4prBYJapTHf@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBdk8eq+f1FtvsmRAgcdJwyDbNRO78YJClQIwM+4bmVcLS9y4
	g/L3iWMjSU1s/6hZ3obrnpbiCPpBAqB5yman2ymuNFeYxwNFV6ByxK8MfXKIw2mF67nr4VaLBOS
	XysjFkDEFn+1hwLbZdfEZTo/L7hp9keSxgE8V+FtBbVbv+DiV+bYJpZYHse24jeXv
X-Gm-Gg: ATEYQzzHHho1wEqDQYxdrUvZDtmaW02OCj4q+yDDbtM3uZ4Tu3IURq7dVN0xoLYFALo
	Ij5h+wMUIyXkC2w/ug07NEmh7xLmp1prfyxDu+Owu6XbegbzJAHRCS01vA9s34SGF5/ZPjA60FU
	eLQ+f58F2emHHfOxsCvhMKSiYfP16pa1UZDS6zr1h9sWwgtxtWsB7fo8IFxucmJZWm4G9FuGy63
	qBwBL3geQvldEbnmyLpCGY01pHnP//knKLWz4dq6FlVA91rSQf4AQ1PtpU2tnkYDBWP+SoJbEVu
	iLqMQ6+ljhDdgoija+T3oUN3ZIB2l2JN/AMwxp/dmwYOdmw/RDhkZD7nLQy4MsZ6qss3hhjrR2q
	559iVO33fKU8LjE3Wi8VXrLoLsqa5tI20tz7XChinXr2uuB16dQh8+eMFunufzd2UW3uIlR4qa9
	xANIw=
X-Received: by 2002:a05:622a:6681:b0:509:a3c:e390 with SMTP id d75a77b69052e-50b80e75f0dmr48907081cf.4.1774522494354;
        Thu, 26 Mar 2026 03:54:54 -0700 (PDT)
X-Received: by 2002:a05:622a:6681:b0:509:a3c:e390 with SMTP id d75a77b69052e-50b80e75f0dmr48906911cf.4.1774522493899;
        Thu, 26 Mar 2026 03:54:53 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad67522fesm881241a12.14.2026.03.26.03.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 03:54:53 -0700 (PDT)
Message-ID: <0b1f733a-dee9-4ac9-99bd-7e18ab403d7e@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 11:54:49 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: sm6125: Use 64 bit addressing
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-6-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fufRpV4f c=1 sm=1 tr=0 ts=69c5107f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=3mFuQuvshfmmPt20Ni8A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: FRSKze7-wxWNj-tVjG60JUk_Dyn8im_z
X-Proofpoint-ORIG-GUID: FRSKze7-wxWNj-tVjG60JUk_Dyn8im_z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA3NSBTYWx0ZWRfX1+o6M+nPtT0c
 YOQC87J7ZEMjEhJjTkbYeQU6NVGruTll2q56ZrK8yt+SAAnQ+GKfBvj+cw5aE5mnFrDgiANb4nx
 nyawRV/UlLqmdihy906B+C50NZlcA6eJ3f40XiwGl9KirWiOSPrudgjY2UdIj85led/4BtjS76A
 LBKxpX+UfSFAMOgLTdOOjizzXG0WQtrn5KnXbocBrhxa/Qlpaf/zP9uS/h0EWCEE4dG5Y9P+GEa
 LQGuG7PaZPuesYsm3D4nkPlQc662PI2xFRWRm0s+uikBODxN1AZ83NXqzcEMhhBO5o3kmeAfWOf
 1MkL4MwMeillpJOZQyRYrGMuWvHRh5W3pfJbscrIvr6wE40CRwyCvZoasRIol34CD//VSgHW4iY
 xwJINzMQBxmEogUn30vlE15azoyWZl794qYHVd7x1FNeMkeAZTjwFxrjOaCyIY/mAbVoI8atmvb
 /K8+uWY43A5WpVNXnrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260075

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> SM6125's SMMU uses 36bit VAs, which is a good indicator that we
> should increase (dma-)ranges - and by extension #address- and
>  #size-cells to prevent things from getting lost in translation
> (both literally and figuratively). Do so.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---

I think this is correct, the address space is definitely larger than
32b, esp. given the SoC can take 8GiB of RAM.. 

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
