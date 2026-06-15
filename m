Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83268305675
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781520159; cv=none; b=lEjuxk3qmi+WAY+3UMm1PF45Y2H6nJ0lu6nBhyNyKqCp+/IYzqIb28JyjybRoYy6QAZ9vBNaqklDevisJ18RyKDHYavXGW6Yfc5SXh41WixAgosvG8CVMvovn5FWkDhpQHLk/yXrzZe1/fsVeFSqN4MvOqXF8y1fJd8AvjTXUwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781520159; c=relaxed/simple;
	bh=PFv8Bc1QwX3m0kl0RA/mhRJh7I4ymyWI54an8mkYJ5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ChXtdlC4HwrJ3iWc4U/15E2UHTUwtHpX2EFhUx6H/D74rjQG/BMsUqPAj6Subx5PCsCZrQUcJa2efGqDhfp3whPZA2drqZOu9RAycKN/4mmVE/vpuGWcFlyKSB6jaBFIDP04lB/Ft1FOXq+JSlw7IDOq7keWbBjphJlVu/rv+cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE0O22jw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ijfl9d3E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE0O22jw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ijfl9d3E"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAImJr3912293
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MoDrHo0nAAL3euwZduxOxWenFYYl8H0QyMF+HqYIOj4=; b=FE0O22jwl1QN8hIZ
	DmjPlCC3hQkvfTaA2H6gCjt+UATlBBsb3pfMkg2pQMM997S6JuGnbRikkHgVxIDa
	hwsMIRLi/gES5do6pDcVbjDW4S/1mKbEoN28be/dUT5uh3IQzYx6hl5TIKNm02fR
	Zc1dng4tQa7KCDZgxXiBSPvWviLFEmn/Wx/PUORtEkJkrN4o3MXVFGv8tjCpdBDY
	nG6LcHOrXe5V0W8R7/T48Y3WjNVA7r5BmLign8SaMDNiAogbDOPEdGtj4mKR4hGJ
	R/yWXfAVbtM4RC3T416GDY6x34c8DdfUp7SWbqDkelr4J5Am5WIZyTc4HIhhUmSo
	wuOgQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa705d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:42:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bf004bf8beso41266405ad.3
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 03:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781520157; x=1782124957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoDrHo0nAAL3euwZduxOxWenFYYl8H0QyMF+HqYIOj4=;
        b=ijfl9d3E+ISbC3tNnJmFbvsh6oaz6Vw9BqBqTlrXPGI0b2lTHGsAQJXcSzEEaNb1OT
         +PApx5lk4skIAVPqBSo9cUpD8FsIx8cULV6kiJcPZvvkp+6lAHYv/AMVOqT4DSDWRKfY
         QIFagz8RigiaeruQJCKA8usKhBPtSCM+xlsKGUzT6eLLusS6G7lmyQRMiHPMymebR5Vb
         p2r3teXMSTwOzrvK7M0lv5/AV2SBHfg1v6tG8/hegZ6VGjZNkZUcKlvjyV1faqbc4d/Z
         4YsdGUIZvIsYiXU8xIgP3ec1raQoDiGQSEhAh9o9y+g0MDfOImBGnKTVYEjQKhEkPVAm
         B7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781520157; x=1782124957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MoDrHo0nAAL3euwZduxOxWenFYYl8H0QyMF+HqYIOj4=;
        b=Yf9aAMI/nBCZlgXAEpPLA982MQO0Vitpdv1Kfc4BaSbAfAVit9BRPLXSaa0bgNQfYH
         Ehwk/hyQTHuAlAEyAjyVrtyi5QKRkHC2FrfYCrsIHe+Cc0NgxXjIC9IwYy8MyS34pUp8
         vlYZ8mwd4XpZrE0+kwTNjRQ3CSAmdLRgPA+WwzR6w1BN0ADWU5i3oD4pqFnUJPd8o8+i
         7ypu7gK074AiOvVNU97TZ64tHffdyUeGD2joCUbY6vDyPYXfdRWqMn/ei5cWeu6pClQO
         rHuMtbQWVXHVUGX6fIt7Yi+8qdDISlpPPzZnvgz/XIeZDbINKB6a2a4ZMTVPxBhXp2ZW
         DN0Q==
X-Forwarded-Encrypted: i=1; AFNElJ9DikRFW4z9WEe7YCNVWbiYvUoe94irMupHMoPxW006IvbnNS0roiWqduk+aLrPqIRA00eVB/lu7m0J@vger.kernel.org
X-Gm-Message-State: AOJu0YyUfFTgOeROeen/8KRyAyG650GqjLh18o0dRl3yxQvnnlUIORSY
	WC9NcKwoZlZmqshH7t6WlBEa+DaKZSkwMu79ostOj+otFrmq6ZtjJclNZ43LcRgijFUY7ARjudL
	oYj0BUa2o25uVpT4/tX4+jGl7qIl9jcc5fx1dsodHkXoElm2RHdFF9enlt6XDyJLwdzmfOw9y
X-Gm-Gg: Acq92OEgvfG9w74DOkN3kFlDDYT8pjnoziPfKQ6TlsxHXzhG73YB0wBA6TIkT5Q5YAw
	r4yb4DM+OLLAgUpFWJ1e3XT810UKhdFTUmD9hKZGU5lwL4Z8yUwCYxHAXt2i86Kbf+qDCjhJheO
	wt/8rmItYWVEITkYwjRz00fL02mR90GhuyhSkuuZ4XxA/XTmsktk+6jozg50yGPcyG4uz3GP8OV
	+ltSpJzuUXt+2chz00ReC3pJICuS+OHcgMV4Rd7+t9fl0TuL+MlqSX/ifXPgkPyMdEy1i0iy8Vd
	w4pUogRnv22YgzTeR959DJsL57nNs32keFm4+p2aUsplmDGnNcXEV4sX4i8Z6TMtjjJ05OANwnN
	CMAZA7II55aHTt0JqNZUugNBaEFDYbwCZUNkubTxdQK5yA7LOXdHekw==
X-Received: by 2002:a17:903:2acc:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c66426264bmr116470905ad.25.1781520157217;
        Mon, 15 Jun 2026 03:42:37 -0700 (PDT)
X-Received: by 2002:a17:903:2acc:b0:2c0:ab92:584c with SMTP id d9443c01a7336-2c66426264bmr116470495ad.25.1781520156732;
        Mon, 15 Jun 2026 03:42:36 -0700 (PDT)
Received: from [10.217.223.142] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f0f19sm95512865ad.10.2026.06.15.03.42.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:42:36 -0700 (PDT)
Message-ID: <16746ff8-4b33-458d-9c41-3f43bdaca4e6@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:12:29 +0530
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 4/6] arm64: dts: qcom: kodiak: Add OPP-table for ICE
 UFS and ICE eMMC nodes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-4-1cebc8b3275b@oss.qualcomm.com>
 <184dfbd2-4781-4dc2-9165-66b3617bde0e@oss.qualcomm.com>
 <ai+x7Ovc9/pPTu9f@hu-arakshit-hyd.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <ai+x7Ovc9/pPTu9f@hu-arakshit-hyd.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qA-_ZJddIsCxMZjYeitrKUXz7xNfsnOf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExMiBTYWx0ZWRfX/vAdaWtmQMN2
 MFfSN7zIhS3YMHdzoSNCHzMmaNKDhKZeGjF1fczqlepcPdBc31/9UkjvguIotgaWvVAbULT9IDd
 ykYfiBhIofsrB+d5N5mYo6jgzTbZ3aU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExMiBTYWx0ZWRfX+toWW5xxgZdJ
 JVAVrunCd1qtMBwlGq+ZKtWzxFHMZOen5DPfqopiusZrUPhOCNfiAa6Vi1iYyWV32j3UHlet0rG
 Of61l+iDLnwNSR8WRa33834vZtznlO8h13zI7SjlsGAgR+srEqM6uVLGg5Ico3QE1tBKmevKKIF
 sBSxhyrS+oEZp3vcayQcKbfpmdTzh5aemt6HUNfy9O7UQm1iGhmSGPgtVBo1TNRgQABIStUzouD
 Qgv2wChvzFzNtlV+Rl/6q/WOQ6GR1EGNbOXlZbwYziKIo8y1QLmN+zCHlsk9/W/BehBmxf7UMkF
 nE1zUiGH1TRLsqjCaxYm+qVho0lIEQJdOBm+Nj0D0zhec4Qha7uLdtst9Xvc7g7KfRtNz/o/Fpi
 94W4dBJXemjTPJK254qMcicfQxoPpPCVAn1NgHLiGYlIb/MXUoRPuKRJqkuooKxuA1uA+ceEF+L
 bMyn3sHbPJ0317i7Utw==
X-Proofpoint-GUID: qA-_ZJddIsCxMZjYeitrKUXz7xNfsnOf
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a2fd71d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ENEOTGz1k9nZZJ794AwA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150112

>> To align with sdhc_ice(as label name), can we rename to ice_sdhc_opp_table?
> 
> Do you mean sdhc_ice_opp_table?
Yes.

-- 
Regards
Kuldeep

