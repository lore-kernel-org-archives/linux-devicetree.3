Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C43D3D16
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776162145; cv=none; b=UTSr4ntk8J67BWLs3SYk59lxywjhWI2h8sQYUeKpYfoX4fHR1gjfJ40P0TZWlNZxEvFv/GjkQh1StoiU70C4wIa4YwONmPG1IRQjBVawNAeBBw0M6ecndUCOZnuuPfu6NSxJYnA8gvGUuQtWp3thSOPCzZThWmG8mXwdp/Z7nBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776162145; c=relaxed/simple;
	bh=xZvQV0btEQC7XEW4VG5tg7Lr9QviucOi1s3YfDjh96E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IlX7eX3HHIrFXq7+TFAU1q4JtOpvG2+8Grov38aR/85daGbiBFERj7cNudO7sc87h4X8EdBn18J5d++b1A4SYiLXScITCPxiW/u2kX9u3uShm9gtl3K8Mc0aTiEls/UiYYTrc7W/AG/gKQO6qV8Lw9UigyqZYRuDlvxtUa4nlEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hk+1n8Zj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EZvXG5EF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hk+1n8Zj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EZvXG5EF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6CtmU363068
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WiLWJ6pQMYgwg6cQ9yFxe+yYkkxwmMyZ1v9obgTWDr0=; b=Hk+1n8Zj+hgYtzDn
	9FkWtgXpC/fBh5sM3QrJYQj1jql1Gy55waqrO3p6iBmO67bhVGgDEe+pkwLfZMqv
	e+SOkx2NMxY1OFL1HOtwLiHseZNnNB6aoPFFtTgY/K0ryJPLIHxGIP/pbei32BTp
	XRzJ+37zYmk485nF7zCzdYkVS/GwOYqDMvPWEZYfIbNHpQajUlzUA2g56HS6DwgI
	PlPgxc+0SzzdZbHjm7McdpZQIdocJsA8BS2A5exTE0Oc5Qv5vESTM9y8V8slXZST
	Edjjlhc3slWE0KolIv1zZ26Rehuwf5Nwi010eU/78eEl3jCHgwo1BNejZInT4hlk
	1RD/5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh870t9jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 10:22:15 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b33a19837so16788331cf.3
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 03:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776162134; x=1776766934; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WiLWJ6pQMYgwg6cQ9yFxe+yYkkxwmMyZ1v9obgTWDr0=;
        b=EZvXG5EFjdUafvVXBXFL7Hemu1fR7m+4V9iKbP4YaYJy05X4Xf56dSB6G0/StZkHI7
         9DkKmCFyw86sMBSYEnHvxUcH2mn3tyDPegJUqSvO2U0IzSjwU//0fh9HBgDUxJKaStEz
         g8vJjACUz7VdnN4KbWCtXk4KGyG16m+CbFWABxJ7FGAzC6OS7xpC/Y4YHsaS6ltvsmNB
         wmFrkRoKayh5baDBJw2B3innKK16E2T9mG9H/xDj+1bTqgMF46WF3O2MolZMIWLt3MDW
         DuBUvTL9Iu3nz5OWbuZ3Tz+koeq3DAQUY5IMrTI5VlLEKoQ1D5ejD6+OHob76+6xhLvo
         1ALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776162134; x=1776766934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WiLWJ6pQMYgwg6cQ9yFxe+yYkkxwmMyZ1v9obgTWDr0=;
        b=nOTFfheWyo3T/2dCjr3uTLTtDICu3WqvS5cxtbEArwd5MCdLxcghkOYmdGeCd/scb1
         xN1yUo2IP1eCVWxgX9D5ym2NawOg5GhyeIXJohG5/X4sy+ytBVZ0+skqqgvA+44in/wN
         bvyXoo+sp7bVl+VU9YidbY5CW1lS3JlA81xwRQ56YX66z5u1S71m7F6KJuPM//8czDjj
         jeiM0lE6dbiDc1Wa0PXhs08Sap7+tWCdd7hFaio1UjwvgMFOtuEHuOiSPwmo0bwi+p8a
         GpxE8wCVSe8ZKiXO5efs45neB4Ve+3QvXpiWbz4K8SxcyXaypGC79q2+a6kB6PlVgmV4
         GUTQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tiaXjWRmBJGBIUFmVz0ktPc7ac2sqCtRNPA7o/HFwSstzkxu9mCHgPMKDttsr1im0+CM0QuLdq8rP@vger.kernel.org
X-Gm-Message-State: AOJu0YwCB1cNIkZRpVyE7HODvCL38es/Hb3OWaDGH5PYmQzeNYX7PR+i
	660mHtV3Lh66oghtjb8leZuWb1d0/+WLrJ5CvmDTi8DE33LUzNIeYF27K5dvvxH7CplyTBpcDD1
	nB+wRyZUZR4PuEdar5x/q5MFNZjG1CeICpWG8endf79XmooSwr8pdIU05/Z1QmsRg
X-Gm-Gg: AeBDieucc7wVBrcyWUi8aHxn5lZbssLWo88M2WCMWmFyrPR+Wz5/BpPlX7BnvLd/VqV
	0cGf9Si+eXh6FphRM9nvmIdrwK69fc1jGfJeH/ynL6kB2g+GVL8Yhp3YdINHxDBAWxbzQZziD2h
	+rQ+KkWlmlxRhEE7eWv4buUhCq3dKXlt2ZqXD3Flxtjf/Lk/B0uq4IV+AtGrfdHnqiA/jqRWOmd
	RJGH4JmCJaojv7gLha7xI7Bw/RxLSDrAF8XF9h9LnTZ+ldMO5MachrMF1qiA6IvY5k93Za4Xcge
	sHsb40oGoteGRIxhxW4jyGGfJljKVWjTLc13OK60VthV3yE2+y5UODiuLZSudAu0FeC3/m/mFY7
	C85mdHoxyhLdviizMEJyh+0G+DLpJRphqJbn0fV5cHSPfeKIT7wLPS4ViPh0Qo208ZCVXiUFxTP
	Ts27NCqJxeYJZhZA==
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr174980051cf.3.1776162134132;
        Tue, 14 Apr 2026 03:22:14 -0700 (PDT)
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr174979831cf.3.1776162133703;
        Tue, 14 Apr 2026 03:22:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6717ae8cb15sm1311068a12.19.2026.04.14.03.22.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 03:22:12 -0700 (PDT)
Message-ID: <9a424637-2c53-4436-b2fa-a0a77b22bc5b@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 12:22:08 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] arm64: dts: qcom: hamoa: Add label properties to
 CoreSight devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260410-add-label-to-coresight-device-v1-0-d71a6759dbc2@oss.qualcomm.com>
 <20260410-add-label-to-coresight-device-v1-7-d71a6759dbc2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260410-add-label-to-coresight-device-v1-7-d71a6759dbc2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C9vZDwP+ c=1 sm=1 tr=0 ts=69de1557 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=uGyuuOI-cJ-b_BVNecgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA5NiBTYWx0ZWRfXxN24qAzNo4fR
 AkqwpSygKEuqlsUv+UDBTKepWsxOsowb7jI//VgdBH+cByIgVxH0meaMaTs2HkckUsA7OrC5yio
 LffV4pqL1K+jzEfsmygI1SYexC0QO8rdZ/ZmmXmhCpC8zEyt5BkyISNFqPw7em0ftrOFLUVOTki
 86WLGWgP/axrfly0XWZU0ktn8Je3ys+VyRrsF/H+tW6DA6/CIGKluI6+/8m9TjcC0nsgDaTv8ON
 MuRmu6uejVklx1YzCZTh3/PLmn7+b/vtIf+FvGkTu2fHp8/i2ZQPHVD62GXT4sijh92nOLXC6SZ
 38C8DT9y+P+bN4LpzhvhIUwSO2wxQYyLkin0LTgUq4zDdOPGufaE/vrVbl400/nl35LtdhfoZFM
 q3ButyjTOkrX1Q6C1HsDxrWbDFKPqHywCRQZui6VOAnQBIM+M5wTP7NpjaXMDhVujS8uG1gKPW9
 ItveIOr4aGSYCzBKApg==
X-Proofpoint-GUID: Zf9J00bdVPOkKeYuv631gzLhZy6W9tRe
X-Proofpoint-ORIG-GUID: Zf9J00bdVPOkKeYuv631gzLhZy6W9tRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140096

On 4/10/26 5:08 AM, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the hamoa device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
