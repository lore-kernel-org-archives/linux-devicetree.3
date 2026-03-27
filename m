Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A24399001
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774647457; cv=none; b=fpUfS+N4pWzRTlaImQbFisWJC1TdUh819lSiwIbUPKO57nYQxvEg7jBpoaF/4IYu0NaGl4ze1cKEl0HHKsU0+9BxPjHZV82qOrOKkkXOEtRr1+ybaXag1GzFfqjjgV1HUWlUOQOzemwDSHDzXdmRZPFGBCoz32ryRvrsDj/NVOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774647457; c=relaxed/simple;
	bh=52YfLSOX7vzmZCLxLP+4DyZ2hchmO+MZkVv8maGwx2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UdMPrPADagYlFSXJjgGVBGC/cSf6EBHaJMfsRCbyO7S3vDobR95HhSpusn/QzF3x0E+d3P/t2xKX+yf/SNWToBmfpcVze9PT9XDeKwBqvzgE37gri4ZwF4rd31glB8b0/thUGq7AJzrel1n2Xsx4yEXSpwCo8qdUMJP4bctQo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fkO1KHnE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHsZx4+w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fkO1KHnE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHsZx4+w"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RKtX9G452034
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5i4xGwjuVHNOMGgsNb/h/J6
	oYgeiOOf3kbGsOF4WhM=; b=fkO1KHnEenBNKuNmyXMYUGBCDRf3gp0tzWK2sraP
	nZqc5QRDnNbdVJqmFnt0SlNRzRQtd8HS0l6APnQ9k9kOliY4oUYKtcNS1eRAdTUM
	O2BO0K7ALqug7Nzz/kAneDNo+DP/5oOEj+gF9QnmS3VWJSgylsKKG3aIutm70rwU
	F7wGnmf7Xlj2MMMcy3mh9Zeps2TA5/o5UaIZsc0QP1LE57NqyoJiHVrXyDlX1Tn8
	0OkJipETZdc8NlrD+LVy1Cd0ecWl3RJcBe2fK2bUJ8lyMcnzrrC+LewTTdZR7F6p
	SJ8VqhlIDpTc8BVRvmer1cFiw5CqiwkOhuvT0SRIkVe3UQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx3jqu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 21:37:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509219f94b0so27002561cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 14:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774647454; x=1775252254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5i4xGwjuVHNOMGgsNb/h/J6oYgeiOOf3kbGsOF4WhM=;
        b=GHsZx4+w8oeGTPFvMDL/frTmAvOiSYs1CdWH0OjOqySqlqJV20vNRSM2xyzPpi+AjM
         9PF75ASXNgchaemwY651S7v0/1+wCKnbaWBuPb5Djd64p6FuyEIIobbvGBmh0bmDG9Wy
         Vzy/v2Lt0EzTxTbeINlJ7atyZEPR1osGk8OvedAm0VHKu6Iaev8WLV67emIYzjUatRJY
         y3TgblSJWLfGd/Mhu2vBkZEcHXVxlk1lR+U1Pa951ikZ8nfztoHgwevUF3kklAF/EQ4u
         p4u4eGVkiAYbv+p0X+d62X8fJbLIDX7M3SbBIEo6hJFBE34ds9DPKcZ5bjwkfjdrCnQM
         4pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774647454; x=1775252254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5i4xGwjuVHNOMGgsNb/h/J6oYgeiOOf3kbGsOF4WhM=;
        b=avSCxonvFDgdVWGh3Yq7Ptn9d42wAYeiVQrYYt3aIL9IfiCAgTU6GD0sHaCKD4riIN
         ALG1ZFk2jBdZB6ae/XpBQDBBPn0yLoRgupd6O2UWlJS06WRBEBlEe0qv6BqVEc6BCkSw
         J/IImR9KFYvak9BX+p0gcfZd3EZwvJ9hs4P+C1IE+XaMFYNFqpsIpLYOokt9BL6J9rNj
         ohMbQake3Hh97JGtQofP6XjABuzMqjnbJjbGXdlJBRpLVlPZy84Y1qGEI3NOi3dTaOxI
         /pK8bF5R2mpFJZUChVvgu41Nmdzuy6ydja8TcycDZnBN5SVWJW3dO74iyhsON0QdHiFh
         ULhg==
X-Forwarded-Encrypted: i=1; AJvYcCWrtw2eCqy98nwN0U8SvtvvzbLJSFnEXhQKCi1/Ncaj1KGQ6jyal/aThrgd7j6wGR6+Akaw5vfiMqCJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw98LbsVdnvlnoG5XXHbkrte9GtP4GqvcekQtuSCkzziZkaGwe0
	eruiH6aJ2ookWEljSO67kQBmgInFQVN0pjS3OXVahAxvpfkTIRk2yZ1pedkOhwiE78yNQ47FdUs
	Mq8Q+ntOS4jg2ERNAQjsISCvi/0RHNa9v8z3XRBu2kRD2ZyBH2yz/rbfLp4G619/v
X-Gm-Gg: ATEYQzyE5q+zvLESgTuvYIxZsr5UHrHdaiBQVJb8EBjg7MLhS3rTp4bdq2yl59ezSKv
	n/CuJUsP7Zs+KI44ayp3pXaTQ+iIR9M1yJd1fLPPvIBdjv2t52chlgdRA8cVKZtJnrP2BVPxR+N
	bIlUDtbvHQqMs5CZxLx1AAA/p+h17dR+gwwlF+8R+nsdFp+e7uFEXonTEDS5StNytvz1SxOQlAo
	wSpZ1/zQKe7d7QlQEUGz/ScjFgg7kv5/R2xPGqf1zm6AnS7QV3/TPP5uHmyD6VPnL7jut5pDSgJ
	VBlY+pZ9Y0DlADJmWVrzOUFQnMMSECo+oLrSvOUKFmYIPNhTdPfz6nP6WJZidElJze3fL5/0+Je
	53653I71rtAH1oRdDWEDCV1rnbaTzRbd8T9Fn5o7E66mDyZtJ8F3MGBLc/XAEVDBZvWGtUscgw/
	okl2j2J488g2g01o0Jy0P4Xb3sPpTMuOr/TQ8=
X-Received: by 2002:a05:622a:424a:b0:50b:5258:28df with SMTP id d75a77b69052e-50ba37d1d27mr59941501cf.1.1774647454538;
        Fri, 27 Mar 2026 14:37:34 -0700 (PDT)
X-Received: by 2002:a05:622a:424a:b0:50b:5258:28df with SMTP id d75a77b69052e-50ba37d1d27mr59941091cf.1.1774647454123;
        Fri, 27 Mar 2026 14:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931b9sm928931fa.23.2026.03.27.14.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 14:37:31 -0700 (PDT)
Date: Fri, 27 Mar 2026 23:37:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Lenovo
 IdeaCentre Mini X
Message-ID: <rumbl2qbfy47px2ysa42m2ymw3dxmnzrync5lgywfiqwujklpw@7zpzruyignlp>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
 <20260325-ideacentre-v1-3-768b66aaef30@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ideacentre-v1-3-768b66aaef30@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c6f89f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Yw-7cwJRhbzFpx93OmYA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: e0_zRFh4Jj1TZLpTceCHp7pdOiC8pO0p
X-Proofpoint-ORIG-GUID: e0_zRFh4Jj1TZLpTceCHp7pdOiC8pO0p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE1MSBTYWx0ZWRfXzp+hJg76/3vC
 RlyFa8403q8cAB+C53px5N9CoAw6aUMuOG73Y5ro56AZ3F7RE0CYOsHR2o7xcJFtXY5ZX1UGkHo
 PSNDK1CGz2+0kAMdYjVjmbzINPYf63841twUyQNXIG69EII7FntTZ0dZdrRtcj32ljWOtfHXPuv
 yBfXMMwJR9KMWJMqL8fEMxrjXtY6VLSwbT8Z7bO7EYmFWwtvrNKotw4kOfB+T5JcrChu3JJZn5V
 KMHyjv+EbuKznnCiOoQwGK0Dm0JldbkvKC1Pf7wK8IXbrh5XDOku0uj4ioq1GV+GwOLnYcjahPK
 hLhxrybLbxxirxDJ+nNE+zuhX8GfRpyjJsd3ZJrlWZb+q9TJWpPx9auG9PT1ahWPJ6DDEbWdzu4
 AoqgGR2XSng/t1kJhTvz0+EqfqyciHCrjhdkbck56lZWGfMPYjwkEMte0ehAcm7FFn6iRwD56gf
 r+xVouwDhyC5SOzPwhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270151

On Wed, Mar 25, 2026 at 05:34:50PM -0500, Bjorn Andersson wrote:
> The Hamoa-based Lenovo IdeaCentre Mini X provides the same UEFI variable
> access through uefisecapp as other Hamoa devices, add it to the
> allowlist.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 

-- 
With best wishes
Dmitry
