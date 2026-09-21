Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109E63BBA0E
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789978076; cv=none; b=CX9qzcNYuIt8kkPX6m7PN6BFfKiXFqN0EaZ2bpCoHGkCbeLwMAfle/lDZ3xDnajBi2t50rLmqRZ/ogaAEHxvxUs6FQE+5OMu00tW+QUHXi7QHYHxsycdSSUJmsbLooAHN56fwLoibpp+KAuBiMFdKFwJT1f7M5L6CopLgBq5hIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789978076; c=relaxed/simple;
	bh=cvH+3WuyEr47wv0KGVgUlCmeKmek7sC8jywD80CvJHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AYAMoIeFhQTPKu1NXIAVz5ve2GW1OLrj7Su9WpcEZNG+/RTN4aS3kOo34cva0gXoYFABcqSe2sLMjhdF7ZzTp+w2zk4jphLXiuAc9m+yAIaBgdvMY3ntGA4Gpy9SzVKcPQFeyzzqwsfMlup2X2Y2ptXRnrW37i99EyTSGDkYtfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R1/2pkcE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EORiE81N; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R1/2pkcE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EORiE81N"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AOMt3351580
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/XiM1eC4dLtplLQwP0/XNULh
	NoHo+cmbZwnS6s14+1s=; b=R1/2pkcEdFJGNqDx1lYarEAxY6sVthU547XrDWWk
	RDPJJgwyk494ayoml09u/siMx4VdzTEjvj5It7Z/M75HOXMuISRVEWJQhV7UIZu2
	NHZzDYhnzszHD/19AGX5T/iYUuU8rKUj/jTrDOZD502DsulKxe+JWS+WVq1yd79H
	QcbXSVfZoD5sEdIYYnczNzcDVHbAKQXME9RsZ78MkPnnzmCNWoVpPUeSBrFFCCXD
	2Z/Dk9WpfpHLPgmzsNg9/xsZJOzZHkpQiJcR08ymHbejbB5fVmcelAT9ZNWauEaH
	3E+Su1axT86dDF6xvVL0S7KTgOJQrE+H9RJ6NOX2PdO3UQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq799m3s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 08:07:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ae8e7e546so583347085a.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 01:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789978073; x=1790582873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=EORiE81NTxYN8B34ioGpE2NrwV7fBEpfw3FOiQFM2lw/wJq8LPsdWoZ01x7vCLPL4o
         XNHMysKeaCUa6NfC1bBtJKVO7dUNuVQmq8rfv2ZNlK9bR0fKMS5IIeBbAg+ihi2L5CkZ
         0qgS59xylB9jNQNSv+J+ZtToKYIFQ3+u2oZwwrDDzdplPXEq3QBtl34J77NXR+ZShdF6
         7HMlglbxWMrkK12Muyyqmnm9Aw76cuaBTJ2asVP45eP/OgHginX6QjOLlPJkUO9EAq9O
         Fxdx8XOvwLgFFCnvFPjZJfwbCHtv2ITDsLp8jzkRMjUQDinyw1tD9XzLyLw5J2NN9SBV
         krkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789978073; x=1790582873;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/XiM1eC4dLtplLQwP0/XNULhNoHo+cmbZwnS6s14+1s=;
        b=fysuyxYjOpLudKsK5EnevAlo7X9PT8MS/F9Ehw6kcnBJFIKWr+R3QmmNUHD+tbJbvC
         DJkf7fr01DveHXTvgZ94l+CZpiRsOOwaDZqMpHks0aQv6XSzd3YUDEYMkoQ788Wv/YIQ
         8ouoyiknHGab1hoWPFnvMFQexHTxzSQq+rzd1ez7rmLiZPp8dPDf38Vj0g1rV+ph87p2
         R6aX5tF+QmDQGw9wShv7BrsDZqv+IFIdHM1f5cxgYrXhp5Fga63AdyUtDnwUYQlovtBS
         SGdoXlb9p9RCHAH8tXEfHcc43Wf0itz2GnA9AlRioUuqJm4IdakNO/hjXYxcFyyteFk/
         N1kw==
X-Forwarded-Encrypted: i=1; AKwUvByEsa2epe8nP+bCz/Z+i5HfnvimdZa362zAJxq2VyewytGz7ZmiOdS5phAb5kOHrmiGSYOkQ2ymXQim@vger.kernel.org
X-Gm-Message-State: AFuF++k1CwEXIIBBzGNTUlhHeSzy1JgDM6tUzhH63kPuflfRByivFzml
	+GpCQFYUVnlYxLEGm7yI4PWdfab0olMVDA12GJUDp1MOsAlwGmVm3gWt1iu3x5mTHaQ8pm/aliW
	q6Him5vlAT1Esa7xF3NujdhTF1N5Nii5Kv3sLF4EhsUZ2I20SULS9xjMmcDVm88t6
X-Gm-Gg: AYBFou2BrNTmtjGrmPJ5D5ySHMt5aF8WYG7MYQRubGHmmMEJNfy8NDMvTtleqR411Ot
	IaRcxUqAj+QJOA3Wb/+7K0X300Hfc3LOB9XnJBVITP6s4a4ly0we69CKpe/pJNrvxa4KVJZtktK
	6MlaUOtdv8n2y9dB56iQ80xqRaRu/joA4voL3zb4vk65Dbfv28KdudPPzuJPtErLBKCPKbvohee
	TYhUfHSfUOjgdbTXWAsrJsrakiFq92FwWJOneNTSxH2OxHtuzpER5DhAjAElONZ585x2ef6RHrF
	4Iy1/zt5e+mlVpZQPT5/sV05kNh6R4kWBoEa3XZ+z9YtZuF8EfQViGAg8mpui7Up4wUKPViIgKL
	X0VpLoZSqje4PCBk=
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978154085a.48.1789978073479;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a12:b0:939:c3e6:86d6 with SMTP id af79cd13be357-93bf5719c81mr978149685a.48.1789978073021;
        Mon, 21 Sep 2026 01:07:53 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc58a1176sm199397265e9.2.2026.09.21.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 01:07:52 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:07:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: nord-ride-embedded: Enable iris
 video codec node
Message-ID: <th6om2dcxrm2a5kjn64ufunlm4zoubghdcnyvw6ll5xrszegqo@veekszeed2bo>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-3-94428761ec06@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0e5da cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX34Mhm2Q/qYaE
 LS/4rm+aoEpYQp2nZCGJ/F9BtJ9/fDYpMNXQOKBtUV2qMehvBilavv32uRclgTP6zdXAH1De7VT
 Drk4XqCS7FRvmetyZbsw+qMHgHXLV3c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDExNSBTYWx0ZWRfX/fCFPG8l5lOs
 Ls5XqLJZVl5JBmGYkGvrnP4mYoiiL+96y/hXTJFwz7BK2Q7g7nmCd8pLr3H9xHpCELjQ+rD2FtZ
 SchfZZlY1dlffhs4xM4cqFNdy8P03mZDZGb0ZVQyl6td9ff8sLWXxc0WputFemJWSj++zVjz52y
 meoT1z4Dx/vDHTbK7U19RZXWrAjhk5ayru6+HgJsk8cA3c8+pbHT/ebt+sQUXmeEUHuY0RtCvxo
 4wXqY0QANkL/mNsiquJmiQqpWa87mEt3rkrIqMgo9y4vaJT9VbDZI4HbYu7Fjeftt+FIkbfktvC
 LHmJzhfgG+JEjJ9RgRXiNAG6EcT6Z9+RCzROEptPwYyVNamgHj6miN7Vzq1oMiYTB4mtY6+duW/
 bCI/Q+jzJfes8wBwmp35cL1afU+GKVofMRsFVfYjd+jkGz34ilYKd2bJvOS6kub6eitZ46GARsr
 W47wmtCxQHmWJFTmxZQ==
X-Proofpoint-ORIG-GUID: e_XmfMmMx0hPHu7uboC7qY34WQyB_USi
X-Proofpoint-GUID: e_XmfMmMx0hPHu7uboC7qY34WQyB_USi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210115

On 26-09-19 10:14:57, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
