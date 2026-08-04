Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD1345D1A5
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842640; cv=none; b=bIfqKX5vh3uDCmybTobByqR20hu2qfRoBkhHfhvF6Rhfu07kjiE5zKbQy9zo2+w8hydSoaj5TrW4H6mNnRPmSGD1wEXDUdAYIsH6TlHuLEz2A7xGP8SzoymZpSw4C4So1GA6LChiXrSBBpDXUtx5iF9T53MkbhA3Ji+cs3HEjUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842640; c=relaxed/simple;
	bh=dSqYtsfKFijnCsZOZ95MAlgSqmBheENypsz4hHbUyh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTjs6+3ZDqWQObaHLvGXFwdoqRl9+173S+ZkeVZBV75l4sfBeoLjpZLt4qnsgv0pCFZvmsbiZIEgXtqUik40fwLyrQHK4ehDBDbKMjiF24YddYQV7X6t8fkV+FmfVm+XbKpvoVbzsdbRsyUyNWfO0Z32f0vlZ13/7O6Q9K/7cZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSzp/OZz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bE+RH4lD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSzp/OZz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bE+RH4lD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CCm03300257
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 11:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0kUAmeOvZB7aq8PtBEq+wMx
	JDgcUdO8yHMNm6TSqSk=; b=pSzp/OZzOLPvvX8qCOl7hxQw8WODYbzWyC7avT22
	/vLBctRDf7OW+L8cMKXa5izb62xlTCrjp/VW1O2QTYtpJvOKeBBfIkrWKXu0qYHz
	dIvHoNEmp7FWDKpouUjo8eyS562SK005iHHN4/DD3vTEeD45F4LlF/sfXQYf81ul
	bMOMZ6egnuAA76Pcz4WTTQE0D3KxFE+8JZ/KQHnw2t3UnACPJp8rdYnbHD3AS7+f
	1+q6gUc/Z7vMlJi7cLpohfARu7uXk8JfHODNAYsMCIBCXBt+tXAjLaI9yS/098r9
	8NMqhNOdNnvUKdPG0Gc3iuCX9qmEfSOAnAEOyH1AJACeMg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8baga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 11:23:58 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb5ea36f969so4740562a12.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785842637; x=1786447437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0kUAmeOvZB7aq8PtBEq+wMxJDgcUdO8yHMNm6TSqSk=;
        b=bE+RH4lDvxi2tkbYHI2r5iJjPKkl6AuKEAxpR+yJfpQYjot3HKMnHPgCPSgpQ1k+lm
         TqOB9Ji8spnknE2JQnK6H8X2TesY7kNUxkoZ1u1E8+7zfoU0+9XlLoyQWW8dVH4L5Y7m
         cKBynzoV94VQT8umZbeEQVQW/Dbx3ce/qu5/qt1BWw9To7xMsmFbM/q9X4zaCYY7nTNP
         sSEffEBph/omQ5Yz5xXQ5anShjqzgVn7DOCLEIUmC4K8L17sB5gwEANlEUVx6iI3ERDr
         jeDhkD0EHMlgstqBtAHOHIHi71ji9sIDCE60Qa8gS+pCNvl3tEY1klscqwpfc0xajKKp
         VrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842637; x=1786447437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0kUAmeOvZB7aq8PtBEq+wMxJDgcUdO8yHMNm6TSqSk=;
        b=cIGKhApvjAvei3FhJHdx3D9ZTf8MXHYrHJlq9WeQWpV1vG2J/6KHCITupDUEmYl18f
         OGBKOKhgP2vFDTmFKClXgeTpFMyS3DPfkS0aqM2IZGz9fAcoMC4pEEzg2bKJowdhH18Y
         rly4gZEUDG11ob/rav7QxxnNc0svp1BYxkdyEWukBBoQC16RG4IXsUWE877IqlrLUNl6
         luB1GwH5DXX5VNgLRJvbPb/h8WoEzFcIN3RFOruTuiMUCUMf6bkoX4yry2xapHhslcvL
         SHQjI+jmiHKYM+EWI0JdEnOhxcALLNWRKG2VyRp8ETSh3KCtHtz3vcGWTzkICJRzRWaP
         V1QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq5jG4b5FjMp5dbcoas76cRQWzZoiuMoYJxkr2A0+nBIRvsQ2mKf83ZYnP3iEynKLasjDbbhzE8FAks@vger.kernel.org
X-Gm-Message-State: AOJu0YxKRohhW3OelHW9DoX830Pdb+FqjzjL6NqVKGux/+0LCR19/mnH
	kETjSVnYjLSojoh+uN4bVS7do1r62OVKDF4PIhAfFdDwCcLx92u+dhoe5DAV0LblZARIedhqeMn
	UATJMdf6qIX44/TihqkOCBqAP1RvNRptVloVBsalAOn6sOlGHMkKwsFo0WOma/lhA
X-Gm-Gg: AR+sD12/P9+t++vZ+d7wezP8ig6kHnpcXy16fX/XxVGEw0gTE/4ZHWukawh6CTuGZtz
	owUVF/E93XOVPfv6xyIlBJ1D8TWnnY73m8XsmNnJTi+3oBXAv8lRopoNhVI9Rcu9snfosKL6a/5
	rL6N8Bl2h0TSvDuzkR0XIxNwZC5uxKtjprlzcAu7Ze1RExTPtIeqK8KhH152/sRp87/V7GUuGel
	T/Ra1cg0dLxl/fFrIsZEWHNcsrrOtFSmkQhQ4ZaHFbiDFGC1MxwObg4IjlXX088o2yrpUjCnIAl
	23nzOumiFrf123ZV4tFgXcHl12q0J1hFfem6DAFz+h3i3zxURDzjnpCQA7x6pS9YbeHu290r9QL
	B8UQv/2MIPrFJ4Wl+W+66xyNBwV8oeBzUMeT2CPBKred514WLjfYXCnyPB9p0fISkLYUBlFfQyk
	yMfy26M1MVGjDiUvl3blerCn88ilG+/g==
X-Received: by 2002:a05:6a21:9cca:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c92a84ec9amr14379015637.59.1785842637166;
        Tue, 04 Aug 2026 04:23:57 -0700 (PDT)
X-Received: by 2002:a05:6a21:9cca:b0:3bf:6c08:fba7 with SMTP id adf61e73a8af0-3c92a84ec9amr14378980637.59.1785842636763;
        Tue, 04 Aug 2026 04:23:56 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673be4dsm5730394eec.16.2026.08.04.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:23:56 -0700 (PDT)
Date: Tue, 4 Aug 2026 16:53:48 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Subject: Re: [PATCH v14 1/9] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Message-ID: <anHLxOdGJwChDnEz@hu-varada-blr.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-1-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803123537.utocak6hvhl5ijqh@hu-mojha-hyd.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71cbce cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=W_EDbNz8WyltxIkMcgYA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX4LYw4nedDlI/
 vvEylHGiMRGRjj9r6bdTpUlnY53EpMoKSnDyyzNCdMJd2XZCDcrhCaoUapeyvkiUBOVCKt9+3Ta
 068x3d/cdQc9n8FjMO6jEeknfa1BSTICP7IDjCkIojuHh1eMgcRLkpCV1jw1/yw5lH+4y8WwAfK
 9YsMZHDxVrxxCdO4AdlU7hh1yO4Byac1FSbvE/YjdurbkXZ5YGySolp1lFsOoYnw6i8fKOR3EL8
 /wnAfRbGvH1ODsUCTt4HpEXYBF6JNxtPZUh/SpQPFTzW57KEZsrn5fVrX88fxkFZnD+8zX4tGR7
 IIJRXi04CSPO74w7Zpm9Kkl1jc19Pg8aPHtibJNLs2Xjbbs/i/I4HTAwZ9TsE7lrFzUgLCeQJV4
 lXMXQXG3v0JIG3gvY7P4iBKgRhMUui5/ipM27aXL0GeE++CWJyYvJQMnsIF+SVkiEjjgDUkJbvM
 O+oQphSp0xVVjMLshxQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5MCBTYWx0ZWRfX23CXi0Az55Ng
 7c6KYdZyi6AiBczPKv2S9d25aC2ha1X1UZgx7KQ8mYz/DxKu6qWyAs1z74Z6Dd7hG9mgQ7RERNM
 7pT69sNYNnVcw8mjroNWKFvl4IIUj/s=
X-Proofpoint-ORIG-GUID: nOPP9-rqsJ9dUKy3fKdAuzIt-t9HhYKU
X-Proofpoint-GUID: nOPP9-rqsJ9dUKy3fKdAuzIt-t9HhYKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040090

Mukesh,

[ . . . ]

> >  	if (IS_ERR(gunyah_wdt_dev)) {
> > -		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %ld\n",
> > +		dev_err(scm->dev, "Failed to register Gunyah watchdog device: %pe\n",
>
> stray change..

Based on AI feedhack changed %ld to %pe to print PTR_ERR.

Thanks
Varada

> >  			PTR_ERR(gunyah_wdt_dev));
> >  		return;
> >  	}
> > diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
> > index cf90a565fdfb..e58c76aba45c 100644
> > --- a/drivers/firmware/qcom/qcom_scm.h
> > +++ b/drivers/firmware/qcom/qcom_scm.h
> > @@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
> >  #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
> >  #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
> >  #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
> > +#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
> >  #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
> >
> >  #define QCOM_SCM_SVC_IO			0x05
> >
> > --
> > 2.34.1
> >
>
> Otherwise, looks fine.
>
> Reviewed-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>
> --
> -Mukesh Ojha
