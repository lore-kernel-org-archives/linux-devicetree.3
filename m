Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD99537755D
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786607113; cv=none; b=KFszio2UCfYz2uu5qkTDXdW7QI1bcI/VM815ryx46QaJMFKTV+5KNVpRsZkc8NBJnWgikhyaRrfKirxn/vU6gj9fb1NLi6LOtkiY7/bxObPuOqXdx2Ayx896PAQufaFz9yWb0e1SGGxuo2CUDh1gyVEDUXexobQLPLmpV04umSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786607113; c=relaxed/simple;
	bh=UPR1oTO3PJmUqtl+n5kQsgiLADdLpG5fKdCJN7CFOS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlyIIk6W/HOkwrhMF7GdjcddottnrwinjpAp7XgnaP+RuIavtb3rgeu4ZH4gF647A49mjch004eviHh7L9OGiE2Mz8/1kdahgMfb6LB5hDpbEM8qYcuLcXxjNZVThBuZgdL5Cg/6zp0ygHqP0639WwRz27Vio5M1efBPP+sUzIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WINtlxai; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF2n0pZk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WINtlxai";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF2n0pZk"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g38r1530056
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rQDbfdUN+IyLcTMW/cXFburEFTlhuo3IDuFHy2Cp+I0=; b=WINtlxaiEPxBdINV
	RjV/6G0okpXR/cNMdHwFtRLdmIMluUIEGulmVO88UR8RVQnYIqkpZbkZzAl0475I
	ZB/Z3kPSf+0FKdIMqG7SvCQ6xRDr6VuKx6/Z89oKELFVqGTaZM6F22ih8lo0cTMU
	dBxI9BTY7+xGU8IXp1On5Ntrhfg+0N3z+XYgM1wRkTYt2h0mQRsYKz5X58fcfVat
	r6Oho6qA1Q0ZryMAZCKN3HaONBWhIWg+v4p8SUeo33by+Dlsmfhet91kcoDzG2vm
	oAFE1ZMEjO+9fLMvO33FwOeVWb9OwSPKcQlhgebbTya9MYajLskAuBx8X59Q0Dah
	HYLuiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g143hsa9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 07:45:11 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-907a1e04111so4266726d6.2
        for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 00:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786607104; x=1787211904; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rQDbfdUN+IyLcTMW/cXFburEFTlhuo3IDuFHy2Cp+I0=;
        b=ZF2n0pZkDnJvN6qvycj/FFu6V5Mev9bLKAgArBrRb8g5keue9ANeeWgJxIV+1cJ4gb
         K0m/ZTulAEe9Eh6/h9UrysqgDP5syUiAAnE/qOpIHD2bIcNe43gZOOjBcNpY9rnZoRac
         sLJSqiYExVoAGCbKdhb+0BM4xuWK5/Xvdk48XZmpnsSDIktnvtfii4WW8YMuMwVS3fiL
         YKLJQebXcq/oXFGCE0w4SweIpDE4qzazJEUE1HUU6SOG2F69XfX91aqYQXvPH0+DtlLV
         ottFESEihAeUWrsoK6xxSMvhpQasxOoc0d7MEXceyFwrWZ8B/zkue+0acYm9nwjdxPQV
         wyqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786607104; x=1787211904;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQDbfdUN+IyLcTMW/cXFburEFTlhuo3IDuFHy2Cp+I0=;
        b=VTMLixrlGYQ5NGZOCFy0f/D8YS+AMbBQVWRA+erpwejq5CFj3a21dltoivZST5GvC1
         wzkrucO5UYlASt/x/BH9YTfTOX9VwH0H8ksc4C2Ep/tjfnf2vXj58Ofa1zJMnF8WE2ez
         V0OwIS7dedrf47E1jGozAqedu/oQz12T+h1tjcIr4+wz6hcsmiskaJQKITPpmXDHf/4M
         lmE9Ch90DkY+CoPxQMSSmR+HQteDmIpBlpn6NwO9o7yWrmmOl6fsVMD7Qdi4+NSsGuo2
         bLAt3GWDPXTeNJOhuD4ZGXSP0yTsS6d5pa4cbzPSI7Ikun9H93yJ7f23xDh4Aq+M0NB7
         NICQ==
X-Forwarded-Encrypted: i=1; AHgh+Rory6h+avD331gO3IRcPHwmswtbfhkWJrMDDksSlnTxoQhwF8AQ9S1C815c3Zk+wEA2KlqCDLJ4L94l@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7QxzjA6QhHN8rbJ/H4am7mjmJvIZcXXUcrL5tQ4zmGX45e4TP
	CN0gxtfgIlitrnztyk02rjUdKJY7k3RH/3u+p4VwhkFt0rgL3Y6vlOlHZmX/rnPd0nmpZ0bG4sI
	5qlZtg01jjyNnzx4h3rjT8cLIwjPY240dbcLOuye6dnxeYN+F03HiuS+5jP+jTeqw
X-Gm-Gg: AR+sD114D5/QVTmFzA7HH3v+vPJrKzabRftTZBc5F2kRzvgRBeTPrp8lLj8IyCG4fQo
	LcZc3k2d/0FXDfRbdjABjAkURbg65lz9s2X6X9EyEBkHmAHk2oMLFAF3/86Ne0DnBQa2WodZZ0E
	ZDmcvLLOAIgEJQEy6a7cTfo5qMPBX7W1K/TjE0t0MizQOzgespKm5eGNeCL8+kGrKvAngkOyJh6
	EtkNcvkE800AjDy+xpk/NeYQia4YsSwWXDss/PTyKHVQMRKp6pychOdELfsOqL3Wcjx+2Yv9rtJ
	IdLYv6FhdlXKC4LLiO+F2vviViQGJx/bJF154sFIg2MmhAKyf7e2JPBVZXSVLG6mutN/7VeBVb3
	l1D3lkgAUYkjf4c44O9Mo1D2UlWQgj+Wii3x1OnKtqnHbhE6wrN6DPllT8sVNXjk3
X-Received: by 2002:a05:6214:1301:b0:8ca:f47:25ea with SMTP id 6a1803df08f44-90a8092ee22mr36705106d6.0.1786607103920;
        Thu, 13 Aug 2026 00:45:03 -0700 (PDT)
X-Received: by 2002:a05:6214:1301:b0:8ca:f47:25ea with SMTP id 6a1803df08f44-90a8092ee22mr36704696d6.0.1786607103539;
        Thu, 13 Aug 2026 00:45:03 -0700 (PDT)
Received: from [10.111.164.29] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90a8179e4fasm9733956d6.2.2026.08.13.00.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Aug 2026 00:45:02 -0700 (PDT)
Message-ID: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Date: Thu, 13 Aug 2026 15:44:53 +0800
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang
 <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=R5oz39RX c=1 sm=1 tr=0 ts=6a7d7607 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=TWG_K1dlhuyH_i5ZZ2cA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX8ejXd77DmlzP
 n9PA5Au43Dhcpmb8oDjKxs2ra5SNCoaXNsKba7s+0NJT2u01zCP/LbkGzBo1p0AZAmGtnP02E2W
 HEp2c1DIgCdWnDBMx7BJsccfENO+fgKOIzLs9A/NerhG3V/XeVSkWyEcYhMD3P1gvXnMillRy+d
 Kz0YVy/H5gl+a76FqbvoBUW/MMjbw4p7b1atZ+bwz/np9MP5I18L9wkG+HZ3IE4mYmPgm3ZcB0L
 yPCwyELz/bGX9GfX0GsVC0q6vWob0YpK39fRBvhTJ+x/6I6dTYQU248tXOc3pG1KYUK3KjP+NSX
 mrYOehUETEE+OpR0ceJNGknRzBipVedTvUDSFupe2+DwsuPwq3ZPKU6QKOxRgKz4AShqyW2UjV6
 T1AKyUHjyumXaryv/PdxzYVLrkqbs54Yf9A83RVSPo0EEUrN/E56k9xVLe6TCWwMdtB+cU5snmg
 OAWTYjNTiuDT3Tat0zg==
X-Proofpoint-GUID: VevW7TJP5Pzi1LcjoomivAcnNrpXSEkF
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1MiBTYWx0ZWRfX6oAdWM82OKQA
 +8R8yvKND6RF5mQVjF3559v6jmUMCovamBaqDXfdWpPaoz03Q8iRSB9dE1VHlMipDU0+qbESMIN
 IGb1syas/QaMt4i1fMIujxa1QCxY+Us=
X-Proofpoint-ORIG-GUID: VevW7TJP5Pzi1LcjoomivAcnNrpXSEkF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130052



On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
> On 7/20/26 10:43 AM, Yongxing Mou wrote:
>> Kaanapali (SM8750) and Glymur use two display power domains.
>> CORE_GDSC powers the main display hardware while INT2_GDSC
>> powers a subset of SSPP blocks.
> 
> Can they operate independently? Does INT2_GDSC need to be
> powered on after CORE_GDSC?
> 
On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should 
generally track the same state, except that INT2_GDSC may be powered 
down when SSPP1 (VIG2/VIG3/DMA5) is unused.
    - CORE off, INT2 off
     - CORE on,  INT2 off
     - CORE on,  INT2 on
> If so, perhaps changing the clock driver to make CORE a parent
> of INT2 could be the simpler solution
> 
> Konrad
That would still need DT and binding changes -- DPU has to reference 
INT2_GDSC directly to gate it independently, so it can't be hidden in 
the clock driver. The two GDSCs have independent GDSCR registers with no 
HW-enforced sequencing, so they appear to be peers rather than parent/child.
