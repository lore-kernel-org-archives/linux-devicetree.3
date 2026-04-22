Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E45B3C8728
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881287; cv=none; b=QzX4xQRlvi//NRAkhmlw9j3jE8LjmCW+r911cioUxYHP8f4Wu0c419cRPNBRwluOmn1XAlxOn8mlrr+5ypoGDgjz2mnPAg/lug5NFp7n0+xLTCBym0v+x6Q9/GKl9Owj6JCAiGtyF7eRMDZdJvxqEoBfZJIv2BARpCsxOkQ4yzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881287; c=relaxed/simple;
	bh=2MKFckT00bTwLAjGaS/QIwQtxJ8WdHDdfKt1/om0TOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=no3Q26CCLLIUJtxHZ03LKapRvHfzingp3LO4dnMivUyKHR6PIGv5BkGF+pkqTButwopzxzMUK1YJovLrLy129mwzYS4yR4jQR5WU26fuc29QPcLZdZeHsc16I4tXe5xfi6BKzvbHwKWVCiBqWlrB4aWY88lmEszRVOwcGllehA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OoJaC9lq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCiQgh6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OoJaC9lq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCiQgh6v"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MFIZNm664101
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:08:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eGL4W3xafLhI67vmjRtl0nco
	D0XbB1cd1uhSpe+TW0M=; b=OoJaC9lqgEKcE2wAFxoW6RcuC02T/dl9pGl07078
	PLGQivfXNEkEoHBv7IU2pBKY5hJ9n8/+ElJ1oxGieBB32DHjqtYAYzv62fmEF2wJ
	GCOQw/48yXdZYq1Hm2lLlmqglEb6Y4mo3N3YSwK1h3KXtpyOqOCLsgyBsM8v5Jdl
	7oQrBM5ciU9nkR9dviLVO321E+XZ2jV3SZBuqVr08hlZiB8I/BDDSuU+4ZAYN6Ez
	NLF6Wr9IeBzO3XCGPaSbI7NOFcZQCYppu6C7nvNGWEQAnh0D/G5IBjCKvbWFQlth
	t7q8ctlhA7DVYsZA5+kWOAE856DOkzqlhCDWgHuHpSOqmA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dpudgsyjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 18:08:03 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9569b029e1cso3520987241.1
        for <devicetree@vger.kernel.org>; Wed, 22 Apr 2026 11:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776881283; x=1777486083; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eGL4W3xafLhI67vmjRtl0ncoD0XbB1cd1uhSpe+TW0M=;
        b=RCiQgh6vtm9Iu0w36zHq7twanJXryCs/RTZjadW09irlMduenzD8Uk3rVaPrmTGvDW
         AnvV/BHEWP0Gkk83PdXrhCSJWOaMFjP/Rd3vprN7qBg6eXzRPAAazf5DNKX6hMfDBM6N
         zZjFX1LfwWcM875mXsYVW3hkn6GzLnRCCiF/UF3ij/lj9XD1YK5heFqHZ5yxkgJ75NzC
         R35SVnvQtzJXfrYY5dhhy1qxQJwlx4h3x92iKK2WkUwLxrlz2xTkO8Cyt2Dyr6se0Umr
         9S/zZVd+1JKqp3RmrDtjFvnGb4ccwyY9jx7cuqsi9biLIpZspgr26+XU/B8BRFmfOclO
         hCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881283; x=1777486083;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGL4W3xafLhI67vmjRtl0ncoD0XbB1cd1uhSpe+TW0M=;
        b=L1tSQwYdxQWY/xG1HLQ/LszqxzeTk81I1yiNSbuBzcMVJNo6kIF3jnyc6iUXg034Sv
         9suYMaHxe0zF5x7W0tdD1763c+v1y9xhtMSkgmD76xN786eTsRxZArHTRf2ln55a5Tck
         S+BVwVe7PXifzniiGP+SoMtHrT50yaxmFQrLngRJJz3O3edtucR0ZIhTYU4XPCOWAFOT
         uTPk+TiPfEzpnidbqieWD9PsCBrnKQle7190x4dNM9tudnWCTKtt91menT7dqt9Mx/ql
         ks4Gh91zk/XDoEivrlqLxkxuRQxdID1CD2FLc27GpAYuizDFdbh4G9viI/wntQ46NR0O
         3T5A==
X-Forwarded-Encrypted: i=1; AFNElJ+w+n1I0k3QB1XjfHXk2k3G9rE/xVTaH8L7rg2MH1Yvsumo4aGD6aSpaPXBABD80YI4GkuG0guL0i/5@vger.kernel.org
X-Gm-Message-State: AOJu0YzVNMMUlSHeB3yj7yVr4sXxP31P27euB1Lt1eqzY3zjOWEje8di
	h+/xJBmMPk6U8aQkxHrejYdQKSKqJUqu2jZd/eJ3aa9soBAsfuRsF3nCQDJJQKtxpGnCl+uBPKE
	TFxcHoRl57ACQl65Wr3bE1VewhNS9wKpHuoh/8UqWFGu72rHz18QYY7iNTN8ncGSR
X-Gm-Gg: AeBDieunIdCQfecvs7ssnfdvmuxeHCIzZxKoIkgWnmyMLbfbym4FgbhprHQSW1PrFR+
	ytl/sEHqEP6jCy9KDduxgAg9CAcydxm3jjvorjW+N/S8wEQyDw9NJcDTCp7MZj8forQDvloIMDQ
	Hgvk/wItCV7HRJoXuHCAEIkSSNb3tD2oLhdyjyLPs7k+0hb68hirz3Xw7ubhLcdTx1vbazVvSo8
	Qrg130e7vjjr8OGllys2XXK6QZCWYqzjRxyUCxMpjfxglu547+5vqLZkO4tw7ZiPip4ExczvWNK
	NYLVlJnLd0gAlvoDcLN//jRIpjnV8vDEG7R/rSxpFliCCRYSklgfyby70oBilNKNYe/xd0jw7ma
	Iz04E3UqS+Q9lNhNpCAqL3UGa0bq0ASrh/FgJUmD2PlUZJkAzLOHKIdG5EBiu6/C8yFYxFXz7lS
	HLQW/+G22bRSaH/SB7PFsbVsHqi8+KsMbndRbp1RT3sw76xw==
X-Received: by 2002:a05:6102:8547:20b0:61c:5310:e9d5 with SMTP id ada2fe7eead31-61c5310ed40mr3805611137.20.1776881282700;
        Wed, 22 Apr 2026 11:08:02 -0700 (PDT)
X-Received: by 2002:a05:6102:8547:20b0:61c:5310:e9d5 with SMTP id ada2fe7eead31-61c5310ed40mr3805575137.20.1776881282071;
        Wed, 22 Apr 2026 11:08:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb6f0b4csm36552181fa.25.2026.04.22.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:08:00 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:07:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: qcs6490-rb3gen2: Enable 4-lane
 DisplayPort Alt Mode
Message-ID: <cap4ajlodabckfwex2p7oa4jwg3hekol3imsi3fb4et4jysd6a@nqq3ckywtsep>
References: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420-kodiak_4k-v1-1-83dfc66b8f06@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Y9x-9QqHLfl3gGPhQJKjkHWqQmEsebYJ
X-Authority-Analysis: v=2.4 cv=c5ibhx9l c=1 sm=1 tr=0 ts=69e90e83 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=VcLrVzLNYlVDUsZrKLUA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: Y9x-9QqHLfl3gGPhQJKjkHWqQmEsebYJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3NSBTYWx0ZWRfX4O6UE6ukio08
 yEpFAdAYBXgHDGtMUy6/XJWBr7I7N6RhPSGokrxfW0FHpM+5X6HOw4f2qnsfFokXAn0xed+YC7d
 O595d9U25mLvp6/2qvaiGzCzAUIX1ZIAUNa8w60s3xqQicRzX0QaNqvgBa6oPW8WqQknemHlLUk
 xPPwHgAEKdj18pAh6i7kioyvFZPgu0pEL2uIeGLTVjgdVac9cS4ujzkq4A76nQwg/A/x5ElTQOw
 G4Y5NF4oacgiF5eOPAl0rx2J9xt70SvIxbmoepedrJYDZwTLlyvvKb1xUQbNjvYso5TM2B7uJsZ
 ilAiTaA5ug2H4UDGUDrBTOa0fg5tv1ptZj0VGiUBXEBHDWi2AkcQmRCdx1eYRQSmrhEQvLnTiWb
 DE6SJxFrC/3263v3bd5lXEBXbSK0OJRkeRmSyYb66NCv8aD8DtujrFhXPtLeBw4x3/EIUAi+kOh
 vqLuIDTbXLq5zm+Ppuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220175

On Mon, Apr 20, 2026 at 03:30:02PM +0530, Mahadevan P wrote:
> Add the mode-switch property to the QMP combo PHY so that mode-switch
> events are routed to it, allowing the PHY to enter DisplayPort Alternate
> Mode. Expand the DP data-lanes assignment from two to four lanes to make
> use of the full link bandwidth available in this configuration.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
