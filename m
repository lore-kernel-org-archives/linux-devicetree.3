Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFA83CF02E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774438842; cv=none; b=hcgOqMKefFU0Tro+2cythJb3R67CVoHRY7LAX0Ao+33TqZ5v+q4zP5wWL9T50++RFGdw15YpB+ufl7dWP8icM9n0ukSdJCB5VWOj1ss4Hu0k4T7e7sUrYniAxdl5E3B3dlI1PZ3wNUalxcGc3vWnZ//gYVkDhsT6glpKCU/8I3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774438842; c=relaxed/simple;
	bh=oed4OIGa6HMUcdBfNGzGd7pnV7AgkufT26LTltgOq6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DgQlU8wqx+Y46zNpR2nm73+hli772W6TToI+q2hkTduSC9DBHtZJHhthA/8ge1M9hxK+HiT9skBvZzUIkHryUcjiVRiQxUDpfxbzCnLhkKYb8OpEI6RlI5L/UrYkyRmXUzfUTW9RNIu+SojGQ+cGOsSqiPL0ozuKmbSYuH/SpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS24o5V8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TifepK5r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS24o5V8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TifepK5r"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PBGB7R2993870
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=htKG/55QdoEE20t24Ys1H0ng
	22DCDQEkf8u6TymZbRc=; b=TS24o5V8vz1bAKZKJMONcX0ucSb8AV/Kb9/OTpF5
	W+Rf+dW7kSxWZj6DKBizXNIxSMWdtFy69D2TMUYrcaEOznNcu+6MV1KZkZjz67Vv
	F1DrDijIUyniA5kbARa8NsA0OGGTaDWIUMOg7GFhUF4Iur2kgbh6Nhi05dzCBm6I
	SHjPx6DPx2LsDXjIRAsaWA3ZUA5gFslBipdJ56ydbDKiyMmHNJ9rfv5FPL+67eGM
	I3/MikLr868V5OnZ5S1J9w1SghqntazqwzCQc9lz3ewlaWL5Qv0HVcxbkab+Z1M+
	DJlCPdibgEzAm719Ub6LmntQg1g5Ya/6aHmn89rkr8LOLA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4dy4g87d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 11:40:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso23836451cf.2
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774438839; x=1775043639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=htKG/55QdoEE20t24Ys1H0ng22DCDQEkf8u6TymZbRc=;
        b=TifepK5rDwThNWJNeE5Nnu9oB/ws3STyVdE2rvnfnYQOefLpCaf2UtzuoaFWJ2LfJ+
         YLomD4cGHWnlInk5g6MLcX2cKxFzFfqJzrGz1T4yl5x6QVzty31KeYBDAmLMlI1XC+LQ
         InZpvdGCc+AlyQ0JHzGO2fV8/nRTmAG1tCi8Dyx/lgTRB7r/1I63tx8rkOc4pjLyu23c
         OKaRsNtM/S1Gn/ckiizZu1nTDRdPzcY/TaPGE8ouP/RW/0BFRjN/ngayyc8HFpSnzffH
         2o0TADwiNi/a8nt01s8+bE5lU5HaW/lHL3ewEYD1eh7OOsqW0cRIIhTFcMaZCwDPIj7T
         0Q6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438839; x=1775043639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=htKG/55QdoEE20t24Ys1H0ng22DCDQEkf8u6TymZbRc=;
        b=EhiojqvRlB8hlW6TdiSjkofoggapHGkXD2k9wiOVZOBTraKJ3iTAxZhqwE+DwKsiVg
         HA9b7xkGMyjgo2bh+MzHFphaa1aM/Zqb6LThi3KdxiBqIdhr7adoc8qlWMXj95YBa3Zc
         6qixendZQ83pnRIK3VkA18IWi4wkra0D+w/QjYfjH/QIjN6a131LqmHgi2EtwIcqChkv
         j/V3vsQEPcpgxc0zQTSgjVrCBnYLPdep/7kHrZpWnD/pMKhFgVQToWdbIZwYd5nylA5g
         wlSCznMvjLHetkmSoKpID9olG/LBQUtB1+T3n94zASKFh5Q9n3xXnXvcIqq5WswzqqGY
         orxg==
X-Forwarded-Encrypted: i=1; AJvYcCX97D+KRn0Xg5+NgZLLPRyiJJLiR7ImO5M5PbEmpb80g7Tt5qhRb7Jlw9h/ZoWtEs4tSN9ctvrhWLFP@vger.kernel.org
X-Gm-Message-State: AOJu0YzuVqojBo7BzP6Sy+f8SdTq2wBSCcz+9SQAablVKR8Hyicl2T/v
	GLxGO7ETAwx+rCQFtNkQtQqHIu+wDZZbNvG0tY8NXgJNO0F3eM1iUzHdQ7QW04VjtJVwUdpTkPl
	06xNhwEJILbF9Pcbep5zQqcsCyQxzK3zlUgd1GpJiYYmK5snp8osL5eBLae4KrQDN
X-Gm-Gg: ATEYQzweuanhKTeRfXxwj87Lvtu2SW9DWppqQ1Si/LeIHM4nr0EK3VSCSh5/ojoUANB
	wmf5oTQ3QDSU5Z45UofOTr3P1Ow8I0j86aKshNdOJEZZ1O+Jv1+UyGqnX9CCT+Kr8AqnYl6hWKB
	zkjvue8EheSXo1/q6CYAWAXUE05KLyCCCa/V9tZi0/+bSG+kR6yZs2LfxG9eJ031567zraIS1wz
	KoydmXgDnUkq2jzo2u5cgU9BgWgRj63Z9NXf2BsLiENw9hfAssoP40LaFKl7bNcuQ1nLbiQQh8Z
	DrTb6TYpPVfG9lStj48j/PAKzxSJ3IHcR6EpjlKOXCPHvliHRopnpnpv+TPFDFffPFHdbvDmKo2
	W8vptjDvRI/RMA/D7r6lNnnR9ra4JxjcCbLJUtf5emm9VAZBo13ovKXQtoXXHexV8NmJsGaPsFW
	rFQ14LYALZa5me9ROodHSR/M/1gmcEqYLsSSc=
X-Received: by 2002:a05:622a:904:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50b80aded81mr44017581cf.0.1774438839344;
        Wed, 25 Mar 2026 04:40:39 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:506:217e:b0e5 with SMTP id d75a77b69052e-50b80aded81mr44017061cf.0.1774438838888;
        Wed, 25 Mar 2026 04:40:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a298cadec8sm1012713e87.32.2026.03.25.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:40:37 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:40:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Zijun Hu <zijun.hu@oss.qualcomm.com>
Cc: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260224-knp-dts-misc-v6-0-79d20dab8a60@oss.qualcomm.com
Subject: Re: [PATCH 4/6] arm64: dts: qcom: kaanapali-mtp: Enable bluetooth
 and Wifi
Message-ID: <c46islnlfzdawtw4o3holunf2a6rvfs7h5dznaggzptatdlqc6@7pjbwcqdtccl>
References: <20260322-knp-pmic-dt-v1-0-70bc40ea4428@oss.qualcomm.com>
 <20260322-knp-pmic-dt-v1-4-70bc40ea4428@oss.qualcomm.com>
 <b5ogt5phzzifh45zyvzbressexgp4se5m7vvgmvaf3ed723hww@qovynwnps455>
 <13745334-c2dd-4a97-90de-a5ee18cff6a7@oss.qualcomm.com>
 <hyy65v74scdekci3kdowxdcujbmoeyx3vxv6dahvif6rzhloxi@rirggsitayqv>
 <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ee38eaeb-d408-4228-b7a8-bc2d6e4ef056@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA4MiBTYWx0ZWRfXw9njpQ5oTsN3
 NKuIbiPQyBpZOekeGuM+DfXUbeKiqKKritpEji3YVlmCIF4J2lGIMISTGus+cdGzeWOZluoSVzz
 0VsgYIcgBjkqShD3R1FxM2wgTL4Ga+c8xz2sjq4waBz6V/7px6ymXhieoSMYkJgO2T9ieggxsIO
 moBc/DX5YDqBW6oDHgpl8pjEeQIFUnzzRpLy7RdfrH8ZV+CBEBLqsLNj9ye7QYEgQPoBQ3py7XI
 zz9subEk3hkr8Gl2zePne9i+vwCadR225dQX4CbkEX/PcYb9vOA/JXceZUyPxTm2ZUxx49pXxwo
 c7an5xPkx8degRTtullP7VtWdXMGf1t/mesdPF2nv3XhhX+RfOwiq+lXgrjB5JTsEkxzyN6cZOj
 C6wbqnHf7SYx2jFx/xSO7VPca2ZWyBMW0Y1YELPiJu8D01sYHiPTu5T3MXA+F74YsTdpEVC34Ir
 dxnvPhuyP246ZUu6gFw==
X-Proofpoint-ORIG-GUID: Y1MNLvMpYiNNuoX927e36MchAszNxiWG
X-Proofpoint-GUID: Y1MNLvMpYiNNuoX927e36MchAszNxiWG
X-Authority-Analysis: v=2.4 cv=eeUwvrEH c=1 sm=1 tr=0 ts=69c3c9b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=zJKM_INERqMpKYJWsIsA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250082

On Wed, Mar 25, 2026 at 06:59:41PM +0800, Zijun Hu wrote:
> On 3/25/2026 3:08 PM, Dmitry Baryshkov wrote:
> > On Wed, Mar 25, 2026 at 02:40:19PM +0800, Zijun Hu wrote:
> >> On 3/24/2026 9:16 AM, Dmitry Baryshkov wrote:
> >>>> +
> >>>> +	wcn7850-pmu {
> >>>> +		compatible = "qcom,wcn7850-pmu";
> >>>> +
> >>>> +		pinctrl-0 = <&bt_default>, <&sw_ctrl_default>, <&wlan_en>;
> >>>> +		pinctrl-names = "default";
> >>>> +
> >>>> +		bt-enable-gpios = <&pmh0104_j_e1_gpios 5 GPIO_ACTIVE_HIGH>;
> >>>> +		wlan-enable-gpios = <&tlmm 16 GPIO_ACTIVE_HIGH>;
> >>> swctrl-gpios?
> >>
> >> it is '<&sw_ctrl_default>' within 'pinctrl-0' above.
> >> the input pin is not used by power sequencing driver.
> >> just give it some default configurations here.
> > 
> > Please don't mix hardware description and the driver. If the pin is
> > wired, let's describe it in DT.
> > 
> 
> give comments about that pin in this dts file ?
> or give a seperated patch to describe the pin in DT binding schema of "qcom,wcn7850-pmu"?

It is there, as far as I remember.

$ grep swctrl Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
  swctrl-gpios:

-- 
With best wishes
Dmitry
