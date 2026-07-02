Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B808480DDB
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 12:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996237; cv=none; b=A52DCAS/8grI1FtUwS9wGojxgXhWkCAmF1DhdSOXyAs+oujS0noFroFIzTm5jp+kOUxz9AaCJIYAitD1MB40U6izLleDp99kcMTbjNRto51ioyGSDGizOeWqqfGuhZx5Rwdl3GFkCTBkXYdSG2Vlj80EtYMnIsLEdKN0+zP6MBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996237; c=relaxed/simple;
	bh=ZwSUjDqury8+040NfR50NEd/JXixD4yQhums4YsHLU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R6r4I2HMcvJ55c+cEKCaeNUblMl7FXMvulSUl1TT9rJP6QiKG5t4DV7EM1KdCODACxjR/vBxYxLgcN9CVW1MqxwQCBsYJ/LN8M0pIY0jz6K3EFnU1y7DdWBULh9SnXXrm2+3dNYOqZHH6yntCgjEPYEsZnKNfTWimav2oyxMewY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jwDwHVIQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z6yN9UvB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jwDwHVIQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z6yN9UvB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KNjO4115619
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 12:43:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=91xTeCDgDMznnkaPnmi6aYI4
	VoclEpS20yfV9BeMa0Q=; b=jwDwHVIQxXw50AFlDuREeUcMADeBBklqnfT7VIt3
	cNKZKUAaRygNSasaTxZnk3Tq3aGRitRGiBaZeEB0TUeF4SgKJI7Or5dl/iLpmsHL
	Yp6xWISjEC/cV4Qx56fxooummh3MShK17Ux1m8GUTxI8zPal/Dpj9I4NBVut+mCk
	PVfgRU89SExcC5UJKRUP8sCNgx2zlzn5eru/zqRHq2AP31Baj/YN98JKjfG2ZwWN
	J4rsSKWPEJ5iQ8ySy3CO9xMRVdMzHp2gUX20X1VyVFpfh44s0+kgNuYD410uE4US
	s/tRg9uWOE5ikfoIoPe4DFivQ9LU3DXfVbldrC1iPaidUA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940s9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 12:43:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so2059233e0c.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 05:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996234; x=1783601034; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=91xTeCDgDMznnkaPnmi6aYI4VoclEpS20yfV9BeMa0Q=;
        b=Z6yN9UvB5b2mT/Pt0d2p4YM+z5USih3DkTzXQQVxZZfrTtdfLMTDAS/Oemsko+b9uW
         VmeCdiEvZgI4Tc7YOZUESN92zhJpOgohOGYB9Y89tDTBtVFo9BHn/RJzNaJRw8EFFte2
         Eqz8XG6OB0IMKqcgWw/n5OfFcq0ty73MGvpKORuc8ufHG2Hhu7DqkeX9CUm6AIjSnVUH
         KKWKMqLmF2pHg7h44IXHnVraChDuB8Z/hk19qoSreA+x3KnuugY7tXf14XSC9zMEezVK
         f/HsMRV4OJdQUndPbp1H5MxXvUo2ZUCA685VjBP0Raf2No2B9CDNDzOh8pKgtxg8mXol
         NOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996234; x=1783601034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=91xTeCDgDMznnkaPnmi6aYI4VoclEpS20yfV9BeMa0Q=;
        b=NEZy70b7KXG6L9ArfOZADrSq6a5jKrFWm5ihN6s6A5NtrwBINP9QTQ8MyipRvzH96Q
         agbh7G22IRPbF/m33GaqzElKsaEShbIrCv2v/WkN9xJD5ec1ZABqXsIh8YaL0PzdNdqU
         R5EhQqCVH1vP6T4SYWL4FO94JnHW1KDud8PMLfEbdHQAZBnH12v7xZqThY/16RdRc5X5
         EXoIZx8MxvgP71Okzo6b2o469dKzUqsccXEnFc+Bi0s+vNMkhNJ+6dAW+AdEAFs/dYFY
         EOhGgJyjvAmm8L8SyjhT4Maj6CPPg2OK/R5sYOcWqRlccTvfGrSsbk/DS5KfMhPyX93O
         +9+A==
X-Forwarded-Encrypted: i=1; AHgh+Rrkqt8Sr0kQIvxMispwPeJnHFONE0tWAIyPzipaMOxGpFclsMPhnt7rLx18jTFi6+xeko8EFE4iyDru@vger.kernel.org
X-Gm-Message-State: AOJu0YxCffAg9g2qsrLTlTwUlw31C6rrQCSryDZmRxx1l1mxP515q7J4
	iPMI/Xb1KvegYgUneX5m8OOmiA9D2AIPM/ryHnorw3EY/IZtZJ8onYgdYPEzSpJgu7egdYdsJqf
	b7CbLEIvGtEAMYwMESNxKbGLVeKYeWxwsvWWfx2QAucdbxusg1fFpsgdsKHPcS9wC
X-Gm-Gg: AfdE7ckQdkLZUutheT/+rQTKPC/9Tn1FWIYawQSgDE5kqey08ak7y17tOPu66oMSCmx
	UY07vmfYN4F9uAwrSdnF6+mtJ8FLUVzR+sPGbGTVA7hwfaopv8n6zmlvFjEn37jXcATjom1DmQs
	YBanWtlIkrYqmhBZdnnp/cFiAvwBmDds620w2Cr0JtPsZKE2aLDJ8oDa1rItshdBNJcG7fCn7DP
	2TMi3QMupWQcTUv9F4G+qPg1/FAXIrUVb2ukFFA+N0IUEaRtrf0eYV4FHWB/NxeQekUNPyUblIJ
	idfD0VHHbTamPf3fIocndVh8zXeTiVu7JcYUXudnAJioe7A7bbNXky49jOXAdZGi3i5VOFCj4cH
	It43w0gUgVLlDOjAmAX0Lr5xYGbT2CIfKOMvGuN1wZk/ohGN+BlLTrYNg8dPkPGtiwaifVBjuc/
	VVulYoFhpcklUaEnV9Z3eumqmC
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2626077e0c.2.1782996234360;
        Thu, 02 Jul 2026 05:43:54 -0700 (PDT)
X-Received: by 2002:a05:6122:3786:b0:5bb:d233:70bd with SMTP id 71dfb90a1353d-5bddf516321mr2626061e0c.2.1782996233934;
        Thu, 02 Jul 2026 05:43:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89e1c5csm661533e87.70.2026.07.02.05.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:43:52 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:43:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Subject: Re: [PATCH V2 1/4] arm64: dts: qcom: glymur-crd: Update VREG l2b_e0
 and l9b_e0 voltage for SD-card
Message-ID: <tigd54gf6ldtk7d4d2hr46ez6t2v4la7fcfc35d264sh5ey23o@kmsnof527zwk>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702094056.3755467-2-mchunara@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX3G0wqPBHjUT2
 kxok/zI1fx2kPTPsnU071zltkk/QjBfE7RRGe6nQmNQ3LcgK/u1/3Y9luzL7sRW10sTNw/0zelz
 5orw2eTBSqp4lrKY+ozaNeXBoXXKn/wOaTSnP0Wh4zXp26xlzw/VV6N7oROnkVIHs36ae0LJ4Nc
 aPnwPJCaxpaDlLU8ewMCmeVk2kgfuWauftcoHmpmomu1HELcM8q5gEhBo3htJD8TAqkJJH9Srje
 8LHnpVm283+ECkkYLIdiVWlht4k+vcUuXQbIY31MO5jciZYdS7kC9LWEgn1c4WuogKMJ6/zLfsl
 7E5IgpouVUJEUYKlL51544RaffX6QNsNRfzyI8FJlKhWX/gy4NRBIxLSy4N6t89aJXGWU6W6+/p
 IAX4KlNru8ZDTNxT7ITRqAKLbGi74dwOuqm/Rsw78GQ2HS8lk2IWT7y6Rx6G8smxMfIeGuEN3Jm
 7fvq7LIj2ZjtLrkL+Pg==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a465d0b cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-DgS0k4VV-ELQQNWMVoA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: VC9nePT8kJemSyl4To7LGE5laBaFD-AB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXxtRt7GGYlOTs
 3DsIb96ZkzCYSN5jyJg+MblnQuFAWU3no0Zvao4g13M1HsGlnPU1sp11vR+gefiCPYb2E9LxssL
 b5bHOJVxlQWGpgogiguwE6eFjdl8x3E=
X-Proofpoint-GUID: VC9nePT8kJemSyl4To7LGE5laBaFD-AB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133

On Thu, Jul 02, 2026 at 03:10:53PM +0530, Monish Chunara wrote:
> From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> 
> SD cards may need 1.8v VDDIO also to be supported, to accommodate this
> requirement reduce the min voltage to 1.8v for `vreg_l2b_e0` which
> supplies to VDDIO pin of SD card.
> 
> NOTE - Since this SD card is the only client on this regulator, this
> change should not have any side effect on any other clients.
> moreover, SD card driver takes care to explicitly vote for the
> regulator voltage based on the SD card detection sequence.
> 
> Also for stable operation of the SD card increase VDD voltage
> supplied by `vreg_l9b_e0` to 2.96v.
> 
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
