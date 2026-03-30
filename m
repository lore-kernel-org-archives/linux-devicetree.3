Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD733DEAC8
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896642; cv=none; b=uhW5EAzr2kGwt/T8J1t1XuFQ4tm2M9dzc3HlCuwYCzicC/iy+/KgzrGBTGykGbPe5b05LEMrWxI7HRQLLqTL7ibJQSImu2QojaSj8Jly4u9c13nYdUKKppoYg7KAiKkmzZ6MQMqfA8CYnvfEelfrYk9ZfqlSVfL+55pcsr8fCas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896642; c=relaxed/simple;
	bh=aLwIKh+N+N4xy8vnPz2VLHgag2upnEV/MBsHXSFhf9U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxKu9CfrbhgVolWO9v7o08sovS+MDmUBnnXagQF1DMbs1jUodhdeKBEy6FZVz3xz6zLvhWQM5nCTh42Vrk0raFdUDmq5acdpqwX+Cjtmb3CmJvnj/at12VxPiK+a5MGJboJ6bC/a6vc8jVOS/rbIfzexjT5HTnjQBkSiCs6RLhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBt+Qo/E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X65fLjXD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBt+Qo/E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X65fLjXD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UGDZ211402829
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:50:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DE8Sw5kR9lGM4C3h602YOoTU
	pOjpbxDUO0a5++U3Gu0=; b=cBt+Qo/ExYBETSAhLuOmZVN0aPscA8YEqFre4PXg
	/hkz1of2A/QmjdxQK3B+xCXZOpaS1quq79IWwI+vQjA/dEGlz/+LRIVG8uGbmsEq
	3f/eB67dUSGUvgt8WkDQTOnK3SSzrEPh1odpOaFOCTw3I+CQcsi1ASSnwL76GpKg
	3KQz5WYh8Bb93fyBEHWJAU1MLUxwK/0Ew6UFDyG3Vd/2xbRSdyisPTZ2RWRoBXiY
	GaOBKHMDk845WDvlgvYQyiJCz6MWXL2M8uYE3yO03lDoVNoFkMeonF1qFiBGsX3O
	j8NpQeB/2aoahZJUGAyI1RbYLLOYklb16Ud9jl6Z1XsnOQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7r4h9xva-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 18:50:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b52a2d70cso144090411cf.3
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 11:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774896640; x=1775501440; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DE8Sw5kR9lGM4C3h602YOoTUpOjpbxDUO0a5++U3Gu0=;
        b=X65fLjXDAzlxSC0ZBwN7szM0XgkJYCdr9EC/4Bz9VYrSXfHxTMaXz90xqKvuQ6Rr6m
         lprQwV4t53/BkLSIC2APzvpd6Gc3zyw9kuSW8Tcz3n7bFbr/BhhvNwmVQVeTNcXL5PBn
         7hcJI8UYT8d6DrPoek2Fyn+uuM+zfVbyi3+fCN1/HIwGO4/VlUxPg24mGcJTNIGnto5G
         o2SRM1tkorXsnUEF/lmNFVRMP7w21dbUjqQJW1QE6owgSH/A3XfxZOrOOm+oHiD1bTqj
         YamcBTUbiwxLyPE3NEvDoBpftSWD6yRARzgh4aWuxBV+C7tIJwcILR69M9P5HGDC8VNF
         Zgpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896640; x=1775501440;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DE8Sw5kR9lGM4C3h602YOoTUpOjpbxDUO0a5++U3Gu0=;
        b=sMnKJGNCJNkDDn3MBmokQnqqgDJ50favlpZ8qIdEP/+fKlEfE6CzDURsCrbWadb3mz
         bvjwdw5RaVLPBb7pWdOoc8nr22gkI2fFswLZuyojrUc4DnWWNSj5ofiurLDjoSQ9wXIW
         uiS78M0iIOxmv9xyDU+hiJF37T5uZ6n/HurZtfrhP5vj5+rFIVc40npKrss25pVD7b3m
         89Pwoe12IvDA5SrBHQR8Y1xqfmzAjDXHOpHhnm7fsxqIM/qwY9pfyplE480DJAeKR3uH
         29yH12eFb2n//JheVEbUwRZ0P0C2PLO97p5vOPaKl8lcPqHU4k0jYaSC1Cv6OPLpVZx1
         Foew==
X-Forwarded-Encrypted: i=1; AJvYcCX5drCVXAJOJZHAg3H0wBhfpzibS7K0Cj5vZeqdPmYMZK5s4Zd2RPnWC/xutIoACCyxS+MGdMz28J8l@vger.kernel.org
X-Gm-Message-State: AOJu0YzA8clB3TMZBw1zC13h+QT/OwJqRVSS2UmSwQqMnYnR1Rr9qJ9r
	9kdDBVlmGAB1sM3EuNN/zAM7htpaQnV4lQfrJVhAR3pAybFIVHVLbZRaclGwOTWyju3uwXHTYta
	PU/Ik6wp6sNG6Ditad59Demv+KY0GG7pU5skiqHT8Pu0ut9WJtb8hBVuBMTHZcK4+
X-Gm-Gg: ATEYQzyAxQi6zlHUd3QJb03KLD/2BXIWO/cOvMkhxh/zQowCKck86PO5fRdNhTcZPV4
	/u0A3Tr5BLk7dHPSxJ8CLM3faFZQje1TROsV4uoRZmoaGjW9VXHbjJhgjzgFMPmHWmCJCegn3Rp
	OtXiZbQLwfU0WFVMQLzR5KXXK6VlfhliI5YADjqS4qgU21wnnGf/iJBhNpaaaApLei/yMBgKwd7
	3KXOEstNlur+Mby92BxH++cpF7kM9H3+h6eilqJVRVoRx91+GjpS0gZ6oasFyaziWRwJe2sO4kq
	tS1dzuBJiELPTDEG7zxNculRzXuK9iAT4zyBHg45yRDduNQWO0I09uSJGrTdMI/qrf7vyePwO6M
	GKHm7Scx/5Ir9Wo1IvOZd1MkqHq0dY1HB++IFyboWesZenSwZ/r4edWH2oz2S1L6ZmBbxsPZBSc
	Msu7kii65LF2tEo58V8nvZ3ohadZxIb8ougQs=
X-Received: by 2002:ac8:5d05:0:b0:509:2053:ab5a with SMTP id d75a77b69052e-50ba39803eemr172246691cf.57.1774896639545;
        Mon, 30 Mar 2026 11:50:39 -0700 (PDT)
X-Received: by 2002:ac8:5d05:0:b0:509:2053:ab5a with SMTP id d75a77b69052e-50ba39803eemr172246411cf.57.1774896638998;
        Mon, 30 Mar 2026 11:50:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13f4329sm1828151e87.3.2026.03.30.11.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:50:37 -0700 (PDT)
Date: Mon, 30 Mar 2026 21:50:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: display/msm: qcm2290-mdss: Fix missing
 ranges in example
Message-ID: <wsf7oet6r7d55i7f6cdwgor4cqu3hzgqcv3r6lmyfsoivzgzls@v5z7bbea6fxe>
References: <20260325122209.147128-2-krzysztof.kozlowski@oss.qualcomm.com>
 <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <177488647743.633011.6769674149013868210.b4-ty@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDE1NyBTYWx0ZWRfXwV4rpZ70fBb9
 EfpdnRWQt9e1SM8yrlh61yFKiv0N6FkGKJseSrhghO9A7HR1XRp3XZ+XlZG3iwrK4zWXhTu7XAf
 e151jauiFttzq9N1chC+TOfL09Dx+LZpqN3PpuwcfmGfasK2Ox6P8V0wFDw7EOhDYAUsFSvmvkw
 85GhkmBekcCv9UgvgZROKlvOk/makSIPLa4z8fTNCPGtaLJ7Hb7DhWlODCJc8D6nGOqPsW4M/bb
 pHjyhu5uL63KqID81S7DQt0u4dk3gqbVZNKzxiqXZZzcKxeEFCJK8dR1aUzs0nHmSLewWnbbXTT
 rdq6GGTEsP5XtoUf4tJbc/BqnkxB49/+dec0jnnSah14q9zjlN82u+SYdVt0gfw28KiLrBA4sXc
 vR5uM6ByKaANvkRFc+dWPU+VItkjs75E28PvwKq8+EFMt2iOfj5nlWepcVLjxCTJJl1q7VVclE1
 Pcst2CoOuVMRhnCMMEA==
X-Proofpoint-ORIG-GUID: 7p_DX2YFks3JDqq0fMoCcfM_U7pd4tnQ
X-Authority-Analysis: v=2.4 cv=PI0COPqC c=1 sm=1 tr=0 ts=69cac600 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=q8DrNbCZZteTo-H5dVoA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 7p_DX2YFks3JDqq0fMoCcfM_U7pd4tnQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-30_01,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300157

On Mon, Mar 30, 2026 at 11:01:21AM -0500, Bjorn Andersson wrote:
> 
> On Wed, 25 Mar 2026 13:22:10 +0100, Krzysztof Kozlowski wrote:
> > Device node has children with MMIO addressing, so must have ranges:
> > 
> >   msm/qcom,qcm2290-mdss.example.dtb: display-subsystem@5e00000 (qcom,qcm2290-mdss): 'ranges' is a required property
> > 
> > 
> 
> Applied, thanks!
> 
> [1/1] dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example
>       commit: 88bdac5443e5269bb39c4968d5ee0becbffe3f82

Hmm? I don't really mind, but...

> 
> Best regards,
> -- 
> Bjorn Andersson <andersson@kernel.org>

-- 
With best wishes
Dmitry
