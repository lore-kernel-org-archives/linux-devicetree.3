Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505D3324B06
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 20:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776543766; cv=none; b=h842g4OBtAOIkSfy1Lv0e3HauITdh+t+QkwRC8JDg39+hsiIP6ifqOmlpdEt7+BmdpvwA8QdCDxmwg3gC8HbIasx5n4cOnTpVlPg8Qs4cGn07LW3EZFHNXERY2Yt9wwtmRoTUvUlnDose9KWgBPVrIZJMoCM0jZZ7iHzMsPxs7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776543766; c=relaxed/simple;
	bh=fKV/2ufktiWRFzO/z9e2LBLMix7njbSNHisSW9fVXG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxLv6hzbkuQddFN9dwrae0GPIcORQd65nkEe3nJCjE0IHcmqsCwu1ysNLwBr1720uEe7VzqkwKF023lQTerfQLauj7ChBMlJdOq1BAnF6Lbif8KOm3nhu3XR/JLGMt+NwET9ffJa6ic6rRvfn2rsgD8TE3GaCslikGID6aaUWi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hZVvi3Zy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ASlOBai2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hZVvi3Zy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ASlOBai2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IArJml258974
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 20:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SP7wbZ1k3opwG5T/nRFldA17
	XysbpbR/EyzGU0JojL0=; b=hZVvi3ZyIwP1A/MGcy5ixVJmjtylou920TDzXkun
	l9DkshZspuDXbrb1HOV+Ror8IU60eVjHlUswvJD0KcmF9mzRT2lCgA/5HsSesOI6
	L2oXEMtOgpM/DlODS7F/Q7KJltPGn7yau1elVuy+1TrXLDFTrxBTP1Ie6xGZIM+s
	DQh7EnbtvbBBDMvkD3529CSIpFnywrCBF7PcmzlhSoMKNe2iamLqE2Baq+eX3dlz
	91hQEhaH5TGakFTW2IC0GAsjpioCJ52FNXux7Rr04idw4Qh2vlBEK3hCpeXYl499
	ZvgjugJuPFza34WcmJC+IP87qgVdOYBwBcwjK/5p0rXNqQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261se4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 20:22:44 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca172588cso45839496d6.0
        for <devicetree@vger.kernel.org>; Sat, 18 Apr 2026 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776543763; x=1777148563; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SP7wbZ1k3opwG5T/nRFldA17XysbpbR/EyzGU0JojL0=;
        b=ASlOBai2eQpiSBwvJHrWiNBtt9CBpRJkN1ggP4ICBsFqSCKrE04fFn+f5QE9p+V8q8
         WAzi0Y8hpYbncqe3L2mU1FXB3CByeJvwQWFOif/a9yTIo2BHPEHe7d5Zt5eY8+ZuJRnS
         rX66G5a+CXrkJq3ZsP7jlB8U+0EebXy9MdzvlaoCXKsv5WnHDFyZobygHFg2VF0DMFt7
         +ZgLQb5DLeRklm5EOPI3fvfqMIBLlK74ZwcQ6mqZFGyvcdSDolP90SgD6ekWAf3Pbjv3
         dClwH2is8AtLqitT2A7WV7J39XQnfSuN2YAcODs6UigG8fcKHHzXD2Xok9IUygpWbyYn
         JTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776543763; x=1777148563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SP7wbZ1k3opwG5T/nRFldA17XysbpbR/EyzGU0JojL0=;
        b=G6UcfXecJsZmKXzzVnQWHwVoOPlvJaR6Dj+1G4YsVwOe+TqPBAafVHO7BLEgOlsPux
         brgjOjIxLAvt10h7bWKbRgs3MDtf/gHr4LAe3ngiiEoCU1R53A4rY1/691TdZNChNxUb
         luVNp1wfXMn5c/KxEdG/r1wGST9Y8BIkSvzNI5GgdEpg8oJHS82X3TTOKQj7AE7B7Ns7
         TqJouJ9V19d9z7vv/HNmEXgKRq98zK6weo5d4rIBiHuYFAwfB85thvJxOcdFHiFLUEN5
         dFZpIYfzaSvrjB6iNCK/ufvU87HOu1DnawXNNhlWWY5XUTbCng9wBBhN/5Ao5z0zZ5pi
         J6Jg==
X-Forwarded-Encrypted: i=1; AFNElJ+TKzWlkAkLT2dHr9+GRgN0+b/ODLYs7pUcl8KODIjmtaziZ1sQ7Gphoue/npqCw59/EWpcaqZ6ovPZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxwZPc0zQzY/Ket0S4nqkN6GleIk/r03YXoY043oG/NgW/IjZJE
	81wzCU8NgnQlbIeRUIsFbT3U8xU+IqzvfAeb0ClQHntgUTJl0wKzH8LqJkCL4+oO593zfZEKoLX
	Mc0HWqQMfyrEArHPrzH0ccEtTCeztNRDOh/ou3SJ3Y2T4z+WcythJVKWSfX0GWKEtZejvQQzY
X-Gm-Gg: AeBDietT3yZEyB79bCkZsmvEQro2f4mKTx94yc366RJcPAY6NVg4jl7s0XkGp+4qrnl
	S9ma77NAtdNUWvIT61D6q/VFwtQwfAStho/OAmopL2ZQrO6P0fJ951E24vEk37nyX/waPYJ8zsc
	MXMjWKcu321gBr3Va92StbVmu05e5u1hoDAiKn2USZ9NlOoHAGub9jhlhkORHvqPA7xiq8pw5U/
	W408pDEg6sUfrY4RnXqx9KGE5KXVPZKKfIqjW+BLWKj0YxWVdJX5zDG8AFWjeTXNBOyLHVdvtZe
	DeMyaMWT2Yz11UPvsozRlhtp94UhhZiAISYH0tbGaEhODltdjVIQeYtyR+F49Yxvh81pvb+Rb1e
	4fHrUECOvuHJbP0vxPlodPhTlOBG4RF9OOaUopVbYZnkE09Q52Uf/Sy0fGWXjKsp41vrxhzadXr
	7sAd1Lz9kPnxn6CPL/FQn7fwmSUQO8eqi/vZKE35aFb6Gihw==
X-Received: by 2002:a05:6214:5d82:b0:8ac:7616:569c with SMTP id 6a1803df08f44-8b028081f15mr133451056d6.21.1776543763451;
        Sat, 18 Apr 2026 13:22:43 -0700 (PDT)
X-Received: by 2002:a05:6214:5d82:b0:8ac:7616:569c with SMTP id 6a1803df08f44-8b028081f15mr133450716d6.21.1776543762968;
        Sat, 18 Apr 2026 13:22:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad0adsm1600693e87.11.2026.04.18.13.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 13:22:40 -0700 (PDT)
Date: Sat, 18 Apr 2026 23:22:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Introduce IPQ9650 TLMM driver
Message-ID: <q5q7q4wvecgxsrfxjvkrjuonweb3ptq2cgky3peqbrgmbajmx2@6iyhe36qp4sa>
References: <20260415-ipq9650_tlmm-v1-0-bd16ccb06332@oss.qualcomm.com>
 <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260415-ipq9650_tlmm-v1-2-bd16ccb06332@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDIwNSBTYWx0ZWRfXycG9yT2HFihM
 eDyQp5XLD7pNrKQIARlH9uc9oIn/pHHw51ASzL25sygqnS+5wCQB5X8OdSsk3viuFz1NYUzTkJy
 UnDAAvB9wwqNB7OIF2iUxj3z6S2gXSi2sXQistIBN0W6jy6TURW+4fC/aHJ6ncFlwpDB+W80rzZ
 CGVDJqjuV6e9+ZMPxs6WLtg8bD7RfPTZmO4dHL6DBNcMIpJHV9M0h15ku//eFgaBbLAu5WSLuZr
 R2zqkqARFh52uKUUeKZvWA1/P13kfjGnQHfkoMMIIiFjvpViQB+Xk5tnlYTEZVvzyYBQjFrJ8Nk
 60g5Dg6H3l3HVknonF5Th1Ucak8QFVq4/k2VZsn2pi3VUxXVH4dKcfBNnyUjUMASpTclCGZtZ7J
 osb076cf5W3yXmqljfGk/UkjisyvGwk4tbBBV6DAemYJzVe36FScxzXc9bLmvOuD0QwB/5b/0cI
 dIiXInlebaJo4oTNj/Q==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e3e814 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=yEwgHnYd1rMVcNmT1VcA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: ZyLFBKbYc6lTXBbv3voCJIGPc9wx8-1s
X-Proofpoint-GUID: ZyLFBKbYc6lTXBbv3voCJIGPc9wx8-1s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_06,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604180205

On Wed, Apr 15, 2026 at 04:59:25PM +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm's IPQ9650 comes with a TLMM block, like all other platforms,
> so add a driver for it.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/Kconfig.msm       |   9 +
>  drivers/pinctrl/qcom/Makefile          |   1 +
>  drivers/pinctrl/qcom/pinctrl-ipq9650.c | 762 +++++++++++++++++++++++++++++++++
>  3 files changed, 772 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
