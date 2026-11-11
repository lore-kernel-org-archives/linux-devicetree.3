Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794367805;
	b=EAxM364nPplASxf3Y97pclxOf1iwicZRX7YcJfOHwtpWc0En1bsa8dEUe4taBOA4Ncen
	 M3yq77ssvA/oxuuiJhGeniXF0NPBuC+ztnnIZ1YIt292ECuGD74aQIgJigGUlE6Bn1JlF
	 26ju9mTRnd/1JZ6TQU6wZVq2Xq5pd1JG6ak6pwraVZ5pA5r/M5S18NtCf+Y0Px/dILtb2
	 cOmOuDjo5kvuY7WBaqwcWIQs9rc5LllKH8TbWEZV7TEnbyjiuZ5bciVTtW9Q1/C6jX6g+
	 Pm/r7cOa9R+G2wBuz7OgscfKtwwA83rUrdeKEjNijTyjL+IAyeyN5n23+tf2Vom/eCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794367805;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=;
	b=TlY39yQMjbupZWC++7Dse6Qs8dZ22GhmcHVbgkUPDSiwDtLsRQqb1zm0PkJSB0IWlQKS
	 R7foomcvaBCIuoVMFf/ethNc7yD12CYe6QuhX8DgRaR7wZhjHZZ6B+lYtoTdZnD9wC0Ub
	 0pZKT2sya51sdCbucgpJLXNjbUIMsIxYB3kSJ72ZtObViGsFqpwGXff8TfEi6WXJJRMG/
	 z9f0FXXqIasgZqsWrN1V6Ct9Yte5/k1m8MDYaB+MtekmDESKGa4sQwXXvOE+tB7zSkMb4
	 6GAHA+6dW5Jmaszj4WDjFhXv0ZX1LtEe8ZuNvqV9DaZlPclQeUp2uDFx6xfy1IwkyIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0dENm35;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO+Sinvf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F25606A32D
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92F25606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S0dENm35;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO+Sinvf
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1t1oR4167208
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:30:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=; b=S0dENm35vTOYdDml
	DA8NOGLL7NNluA57GO/shSH2ZjZuuhdstH/Wfzlc2TTT71LSEc6okcAB/W62hdJ6
	EP7mdyD1cGW5V/r+qSbiVhCCfYQVeQObVQu4SGhI+OyOVUlBTexHaErVGTsY/Z4L
	hxN+sTVp8RZ6CpqnlOSDjhwrXP59xFUORRlxxC07McgIRfnnRQCVgh50bhMYzL3d
	zTijKjet9rysQ8NJhzOauTxJp+7TXJHIsG8tOMPSXA8EmnY+F23XwRNLM5Wmtss3
	Ow+zuZygRIQoM218cnBIkU+3ekLPbyX8Wr6kuxWETVap+l0BvN9kEVvEfFHtT1+M
	gab8ug==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyw4c3wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 03:30:03 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3763bd79663so892319eec.0
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 19:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794367803; x=1794972603; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=;
        b=CO+SinvfJALCATS8spBnR87zErErm9mljgdyLprsaHnkIEZePMcZ9JvzopcnRsqCAs
         Zh/ASIitx6rR2+4tZnb+4PejGwbXH4EhG2OFjcUj3/+PJT/N+eyE/a9ITBUb5gTdDdOm
         sgr2od1tvq9h3DKyU0utz1Shiy2dz5plfr82Ptl4IjJ/s4qbHR4zvIz2gVya5tJ3Qvy4
         8vC69nmGVlr7Hn/ov+UVA65NVmCCc5G4oUDUmoWscROmBJBFiOp3m7UV9c2jgNOdgTbV
         m1AA6tjx5jz3O7eg50QeHS9ytjETR7Uuq9lGcuQ7jTnec+6g7vTalVJiUkVqrUZTS45Y
         Rttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794367803; x=1794972603;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YdUMTqtAOkvENFK918Fy2pUtYQjevISfmJKm9P9R3QQ=;
        b=KtNOmX+WonNnk4WbcQ9Juyg+gtSBMc5Lik8YoUGCGyXuf3820xYS0gWk/9cooESGeh
         SFdHJlBLFDTcZpeOAqRjukpa389Phsr0Cy//ug7XQD4z4HEgyWbL29tDCmj2G24ETCgA
         dx2tekWm+u4nNGAxVDhS8pOlkNxDfXSA6Cv1B+EOXrXpEMSiZ0hxtpgDCeNEePWpOHPb
         Zu02uRSWDfNeaOSJ08haJbAzzj3k+OqrnBI2j2mL22+4vQGRHpSQB6/DsiuPAqlMNFZv
         ZuettC83tnQb4LxWzapC2c6fw1MqT0sZSqRaXjdhTEbxmBl5768DFaWioc/Wc1xJcSQA
         Nopg==
X-Forwarded-Encrypted: i=1; AL+hErEhjkvQzw+RadFch9MRSfg01mwJMmeBRPIjgsdIULJm6EuirxwGsdGRCG2aduhWPsi9r9VErV7BCy1W@vger.kernel.org
X-Gm-Message-State: APuU4Z9GdwLJIpMd1FUHgC8d9zYC3toCaLcdLMvL8jiC2QNst1iYIgmf
	NJb2wGXK1lue+zOam4nHU1znmhlRWNm0+R9nSjQfMv4VHB2LezT3jlVhvt5t6CkebJobYgmH6Fk
	GSn9frUuFdK5/t42g2uer8eFVloJq+Tk948nNnPBq0qr+cNwNT7wt4sUXpaqlcdV/
X-Gm-Gg: AYBFou27hRiQfnQGcy8TkE/bTB/MgbG4tO+l/C3qTqKt6HShoudRt6JciM9dfd8zTBU
	lhJjl4xE+VtUxdbWoCL6HgzAirpLyHoQaFqfoDREgOjA5GkFsIsBfEk3O1RgK3Pu5kjreqxi19t
	+8g3ccYw174L8LlKsETO9MUikbgELxP50bV/e9DYY5dDdac39v++yYZZ6r3DSaZLjfWV9IoXRLR
	kVT0jZp6qhD2YWyr+5Vc5Ye/+39uXjZHSmubLQ0iKK8drlquEddbDj9Y+EPTV6eRcONfCTDITc2
	THRTjatrm29sYP/qVRJTBLIeA9iszl5o/ktxJQaq5Egueyb+4tdG/pbPCBrgrT6q066J7ZN50Xm
	d1SohAS7A40ic+m9xMMXNLgqLmY6SCuL3NJyaWHAobhr1ulk821XTZW1jnK/NHteq4iQBad37tQ
	NxJHd0BTwQsbYjxUzKE+2Lfw==
X-Received: by 2002:a05:693c:8942:10b0:36b:f09f:924a with SMTP id 5a478bee46e88-3768617abeamr1782658eec.14.1794367802970;
        Tue, 10 Nov 2026 19:30:02 -0800 (PST)
X-Received: by 2002:a05:693c:8942:10b0:36b:f09f:924a with SMTP id 5a478bee46e88-3768617abeamr1782624eec.14.1794367802272;
        Tue, 10 Nov 2026 19:30:02 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375212e9e03sm23040256eec.23.2026.11.10.19.30.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:30:01 -0800 (PST)
Date: Tue, 10 Nov 2026 19:29:59 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Akash Kumar <akash.kumar@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
Message-ID: <avPhN0uahZkYVFSK@hu-petche-lv.qualcomm.com>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <avGLwjn6yZRqpBhF@hu-petche-lv.qualcomm.com>
 <f1beca15-91da-47df-aaa8-a2a816087b88@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1beca15-91da-47df-aaa8-a2a816087b88@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfX1spy6oV0nU7w
 PspqwXpMHqjyJf91aIVeGO07PWNIbMoXtATeByQW+kW6H26f3pP33aN91ISsSp4K6NYy6uzZ0yL
 W2KEPs3aE2G7mYSdlhuiKRkmSgP2KO+NrePnXHcAJip9oWCPf4tN2WIcRh4JVjgg4QUnG6WynKm
 z4QEsLH76bymQOAMsLJ8ptZAqhTJk/qx2lnn8GasysnP/Pf/7/tYtdypI+RsJsVgGYeuSrOTf2L
 EI8H7QDGovOYwg40ESdsDnvb0xlOG6+isr7p0yqMY2/Au3jUU6i9GRRw6LKKuSG66hlWrOMwjhQ
 JUF8TOY0LCOvVS1GgKKpP+pkgBEAL8RFgP1Mn7V4XsoeC/QY/Nq6jKEer/jGh0YAPxE8FU1OB53
 SAeowHjt8ep61IzOC6JrTEEkAoZwTpwUtiETNqG15P6rbowpzcqVgKFu0dpJnNJV2fjO8pLl9je
 4WgBE2vK5RI4I+J+S3Q==
X-Authority-Analysis: v=2.4 cv=Ee1d0/mC c=1 sm=1 tr=0 ts=6af3e13c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=kQgC6_mu_KQiaI9rv0QA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxMyBTYWx0ZWRfXypFYTJBbGBFP
 KvxuqO/AWAJ2P0w+jIxt0KZK1julfzrUscUq0GcfDEgRTSuARDmGArUeRHCGI4Y4nOwtxKynl0t
 YE6WzbEIRki9aTZ18l00SrNjrptn76I=
X-Proofpoint-GUID: SrxlJX7DG02JbXGbw-Z1gXR10bSxOAvj
X-Proofpoint-ORIG-GUID: SrxlJX7DG02JbXGbw-Z1gXR10bSxOAvj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110013

On 26-11-10 18:11:31, Akash Kumar wrote:
> 
> On 09-11-2026 14:30, Peter Chen wrote:
> > On 26-11-05 15:32:16, Akash Kumar wrote:
> > > Increase the nominal max USB memory bandwidth vote to let DDR scale
> > > higher within its nominal corner, fixing glitches seen during
> > > simultaneous USB audio use cases.
> > > 
> > > USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
> > > MB/s, ~1.8x). This ICC vote does not by itself determine DDR
> > > frequency; the vote-to-frequency mapping is platform-specific and
> > > comes from each target's interconnect/OPP table. On the tested
> > > targets, the old vote kept DDR pinned at 1 GHz within the nominal
> > > corner, even though DDR can run at 1.5 GHz (+50%) within the same
> > > corner. At 1 GHz, glitches were observed during multiple concurrent
> > > USB audio use cases.
> > How we decide which value is suitable, eg, you set 4500 here?
> > If DDR can run higher, and we have more stress test case like UAS
> > transfer + UVC transfer, do we need this value to be higher?
> > 
> > Is it okay we just set the highest value for USB, there is a platform
> > OPP table, and we let ICC choose the highest value for USB at specific
> > platform?
> > 
> > Peter
> > 
> Hi Peter,
> 
> 4500 MB/s was arrived at empirically, not computed: we swept the peak SS
> vote on each tested target and read back the committed DDR frequency.
> 2500 MB/s capped every target at 1 GHz; 4500 MB/s is the smallest common
> vote that reliably crosses into the 1.5 GHz nominal step on all of
> them without pushing any target into the next corner above nominal.
> 1.5 GHz is also the DDR frequency our power team's KPI bandwidth table
> accepts as nominal, so this vote keeps us inside the power budget they've
> signed off on, not just inside a technically-valid corner.
> 
> We've additionally run isochronous endpoint use cases with this change —
> mobile platform passes the full MJPEG test suite at this vote with no regressions.
> We've also verified UAC+UVC concurrently: for that combination,
> DDR is bumped at runtime on demand by the userspace application
> rather than relying on this static floor vote alone.
> 
> That's also why we didn't just vote the platform max and let ICC pick:
> not every USB use case needs or should force DDR to its ceiling.
> If we voted max unconditionally for all USB activity, DDR would sit
> pinned at the highest corner any time a SS device is attached, which shows up
> directly as a regression on the power dashboard across every platform using
> this shared driver. The static vote here is sized for the common case;
> use cases that genuinely need more (like UAC+UVC) bump DDR explicitly at
> runtime instead of paying that cost unconditionally.
> 
> In Future, we have a plan to make  it configurable from device tree which can
> be done based on target.
> 

Akash, thanks for detail explanation. I had not considered power consumption affect.
So, we set a default value for balance performance and power at most platforms,
in future, we could configure it through device tree or use space according to
scenario.

-- 

Thanks,
Peter Chen
