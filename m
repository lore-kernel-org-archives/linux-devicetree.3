Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F33A381D
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 23:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777937311; cv=none; b=f2DkrGj43wQxu97rl34UAYvDRlPZikUgzYywuVWnEjnQuqzDaaP5kxb1v+oCPz9lb58YRmxPaHNPQSGTV0OxdFU+ohCv/YxZJB7nj3b7CU2EwEdiJVZfm5ZeOUYb8rWO6wuFL4s0ADByAC73LrW44Wzqwxi42CS0nu7wZgbs0ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777937311; c=relaxed/simple;
	bh=X1GBNJlUxIvwaP5q19nAsgyfWzEw0IbvBNIeYZPLceE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a+Ixo2fAaAZ/McLKPR6xO3jXhAC/iBf1RzRNuPLtZuhApMhQAD7IW7e1m6A3lpTzUtmzo/5RmixHRcbaV76YeOOecaH0Ye+a8XdEFP5oXjW7BWMYSUL1hUHXoG/Ds9aOBUqltF433xqCL6mucpzO4lzgjRjbkmNdFEU73svZeyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pVgPpX9+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S5QoQMMw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pVgPpX9+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S5QoQMMw"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644I4PAL1152055
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 23:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OW8ExNy2YqbaXe7/878R5Y8n
	r+DTNs0enLHqpGAdej8=; b=pVgPpX9+ch5h1jvr0aYu7U5WnTx6dOHPPtLEOqIY
	Ay+vgj1VgkRfonUEVRqKKX4ib+3B4pBipwBv1a7if59ypVgb6Cx5wPLQFNB+4kgb
	0XGeBe8SEMgwhF78ADancTisQtSzUf0cFZ0qwEmhdIMvg65/b5+g8+vHZfNncOH9
	X53RUNNPDAxYO6MKb3pLSp9ar3fMTofrOO+iNJ3+31QaOaMYdSsPHMDXQbIU4mdJ
	98RNLIiw10FvXUQIO4G2UWWb8Qp+IE6fTAypr/6RPlm0k6aoZyIRIVxzegY0AU5J
	rsqm07fy/bJG11d3vUc293ITBNOLxc5mG7MLaPk83FnHDg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxscyanjw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 23:28:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50f817c3240so63111231cf.1
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 16:28:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777937308; x=1778542108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OW8ExNy2YqbaXe7/878R5Y8nr+DTNs0enLHqpGAdej8=;
        b=S5QoQMMwzFN+F1x7fXB2grRkxruIOa28BPaACTENdzmAe+MqfXYwkjgI+dkOR5mDKs
         xZyoZIWvR9RXiH1y3gaP6XnCRyNTn+15EbGbZHe3QcOULpY/tXog7kF1QwlN9pQZIKBx
         pCqIYvNfmlkVgkbj1lfNFoGAweXPyHRxHviQwDPkGREB0KRR6bwnvZnqzid14oENnMpO
         1XR4m0YvExx9MVAzqrtSz4Ln1EMWZGUgT4RmVYV9JbFzC5p/iud5ph1MWar+kOSwdDOo
         xYJcmV/NQxKlkf0hGU446txt48SZbyzD5nJEibekWPWiAw1FtcXKQBxb4ymlvs90DQFw
         Z3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777937308; x=1778542108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OW8ExNy2YqbaXe7/878R5Y8nr+DTNs0enLHqpGAdej8=;
        b=dXJi11oJME1Q8gzC2YPTmOMYqypav0teFNOC2HZkz8qBKvXi19dxe3OtVvLCOo9VXf
         DR+wPgu8rz+bTLoNTZNhHnqr9ATzZz47FSfZmpTmnrlcwpe8PjDzN26uk7FIPd1UoEI8
         Q3lh4GM2/g7IB0305/49AQ5gd/jCcU9bq2XbSdAAvW5Jrkua2H1POrUCBWkw+nYa0sUT
         6gIRo0xLSTRqRrrDYuVAtsV+haGHj0Ksp565yOsQLxRoPIhUL6EWu0tnVnZZpeWmInsc
         1T4MPFkLsWUehy4u0ZHdlKa70moHMuMJzXo+tq05NAWpzhxhcsaDOWrDBxSp+rGTBv13
         Kc2Q==
X-Forwarded-Encrypted: i=1; AFNElJ9Ojg5X2OdLVeWWpecsbgVs9+qI1/c5K1g1Z/N9QmaVJ58sOoGSgKk5CiZ5l378hn1E38x/rnTNB48x@vger.kernel.org
X-Gm-Message-State: AOJu0YzLnnYni/nElCWIBk7a7UereOBOM51CMLzg/VYujQ94mM/sRuxd
	Q6jQY/1fUTwLbjGIo1tCHEQgiO7DJ1Fe6IWFcUph9ikuKZA4xlzcAAuiGUFy2UGWKaASKluNFiC
	CWu1egeHlTg+Rj9acQsc4E+Aw4VV9YYbicEdgnhODVVH4SC/LeUjwV2i1hnenjB/Ib9GPW5mF
X-Gm-Gg: AeBDiesdCDuepjdJrfn5cK+yu1PXYVJSEVV2n2lneKIhvbov4enpxvuqV2LqG3TXveW
	rf2hso8HpUblRX8C7FbCICI4KVWsVVmAixQoMgDMy8NGiBUY7wJQEw3FoYJLxFWw747Jynl01fj
	t4wuE4BzFlEUaU3GopZT1i8cEBu5287uFph1sNXRjnQ4cGpVOk2vYoo92pPbvHs0eXkTyJ8fm3t
	CvSPutT8NQyF3ZEd7q4MWyrVC8pjrZMCFxschBQ/xgcg449ctqTE5hahalLh+eIQeRNFe4RzX2d
	84857uk/ImiWcRxXzVaCwf/KkgSfw+IYG+QZt6gvP8UKd8pMjHDA/qiGf5AAxDXhphnQXEM2wiR
	1sph9cA+AjAP8XDKehjQ/I8P3rWlWfJ7JqusyxTxeLSz73W+L+WkCxBp79SCOvzM7f8KmDNc1GK
	QIT4lpqY+UjchIcW7LKlofKJ97vb5CIZLyh0hHII73cVCbiQ==
X-Received: by 2002:ac8:5796:0:b0:50d:84e4:e1ed with SMTP id d75a77b69052e-5104bf9a7c1mr172864451cf.30.1777937307743;
        Mon, 04 May 2026 16:28:27 -0700 (PDT)
X-Received: by 2002:ac8:5796:0:b0:50d:84e4:e1ed with SMTP id d75a77b69052e-5104bf9a7c1mr172864121cf.30.1777937307244;
        Mon, 04 May 2026 16:28:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c346ae5sm3392670e87.73.2026.05.04.16.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 16:28:24 -0700 (PDT)
Date: Tue, 5 May 2026 02:28:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: monaco-evk: Extract common EVK
 hardware into shared dtsi
Message-ID: <uxklfc663dzdjxd5e7gd6mftddty2nxqypoandbwakydgrjhaa@s5mskp2tlfch>
References: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
 <20260427170505.1494703-2-umang.chheda@oss.qualcomm.com>
 <36ghmwuwqgm3d432nkklw4igl6wpr5snug7jpha6ioz52qev7f@4g5pxcjxx5rg>
 <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6cea3306-280b-4f01-be46-28e546cebbda@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIxOCBTYWx0ZWRfX0c34gg2ehLHH
 1YnTmrORWlR04knWFMGf7fdtVvP6ttChX+WqoW7EYDYXRlqKvO2dkLrOqi5bYDyq9unDV7ABnqY
 25KjOC/Gx2FTPoQYW9WnHGvHHVjrwsPits2bz3Ew+m2VkPXXHpWOpFe+ifVfcIKWVTd2b0lMz1+
 9NW3x2sNTNHd/MI+w58yqlVDHDR/TARcA+hjUEWKHJosG3iFYPV/HKsACnnDZSZK4RnjpbWfMHT
 ZANVP+eZ6FadPSri8ppBB/MxSTUgSsF1E8sqlNkKY0zr0Llf24qsRTVnHM8GF8V3ZxeEL1ShPOQ
 Y8Uug5g3Z3az8S1xQQBJmCjMjfMQAujfZSfYZyb91P8j8g9hawrinA24qpvovLykpiUxWGvXbmE
 GYPZM8y2PKQg3mn62EKJjT1XjtseCerAPKU/x8RXllyUOSmHDYu7NZN+BiOGtSQQFzG93s0yg6c
 6ZlnJYhFs0PrR7TLJDw==
X-Proofpoint-ORIG-GUID: dGWjsEv6W4_fjzuSaKOJCIKven3iZWfX
X-Proofpoint-GUID: dGWjsEv6W4_fjzuSaKOJCIKven3iZWfX
X-Authority-Analysis: v=2.4 cv=C47ZDwP+ c=1 sm=1 tr=0 ts=69f92b9d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5WgXPmZedZYfiB6p-UsA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040218

On Tue, May 05, 2026 at 12:56:15AM +0530, Umang Chheda wrote:
> Hello Dmitry,
> 
> 
> On 5/5/2026 12:14 AM, Dmitry Baryshkov wrote:
> > On Mon, Apr 27, 2026 at 10:35:02PM +0530, Umang Chheda wrote:
> >> The monaco-ac EVK is a new board variant which shares the majority of
> >> its hardware description with the existing monaco-evk board.
> > 
> > No, this is not a good reason. Is there a common PCB? There was a long
> > discussion for it for the Hamoa / Purwa EVK.
> 
> PCB is not common for these 2 boards.
> 
> Also, not sure if I mis-understood you - You had mentioned to have a
> common file for both the variants [1] in the earlier version of patch
> hence refactored it this way.

There was an explicit question if PCB is the same as a prerequisite for
the unification of DTS

> 
> [1]
> https://lore.kernel.org/lkml/7r6373fo56alzqa4e2zzdnsgwfhgdkmbhxe4cvdo4p7fg3zren@eyiml4uedfbn/
> 
> > 
> >>
> >> In preparation for adding this variant, extract the common hardware
> >> nodes from monaco-evk.dts into a new shared monaco-evk-common.dtsi
> >> include file, and update monaco-evk.dts to include it and keep only
> >> board-specific overrides.
> >>
> >> No functional change intended.
> >>
> >> Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
> >> ---
> > 
> 
> Thanks,
> Umang
> 

-- 
With best wishes
Dmitry
