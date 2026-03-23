Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CBA2D23B9
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774264856; cv=none; b=XuZ8TA/tuvrfjo4T8pPIVDNt6jGLM+qOMaNX1OJPydhHr9bWnBJQNeYJspJnUlQOTpecuYclC214kbOjQjzh0K5JThUDOtY0oOyUQrFbPU3GDaj3Vh/odsprvLV2zjEsIgIeRODFiUA8otsG7xlcMHwtNEHzY2kxOvf8zh+lppE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774264856; c=relaxed/simple;
	bh=0UmgcQOBDkYfiHuK4wqGI3J4ga9mXxdIzGHPC2oGJqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZxHOL4sN2PLwEQnyqF3ecmouCFQKLCEXlxWNJjpA2xburqZshZAxIHrtsP52CHOLkFNyBL43DVTcPb/3TOEfD5RkuYIsLzw2FWQawwFP3x7BljafFSi+DxjZ5lZ/hN/JEa01ESbtJY3ClXGCs3l0YRKoyx2Ob8eNkmst6vbVn4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jnJwlENf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F6HzPIPP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jnJwlENf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F6HzPIPP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tUZE1627059
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:20:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i5tjGQ5WsisvqjUSW7WzmXu0
	LITnZly6yrYhXPmtf1U=; b=jnJwlENf2eB2GnlfDHWCertNfcYzZCZsafD/cpIp
	frEA9zk6AgH2Sr8JKoSfqF2EYCgIr0YPYqJrNTIMbZZDONe4+a8QAS+a1DDJKw84
	6dtKYAjtE+fTF3TFpcS8OI0wsPwxd/i9RvBksAe82/gkUMwfYDb2CWYRSsBV4XKk
	XMbSi6+MSsv+IyTC6mrFB8nDECamhoT5cP9sDzvnkvyTIv3H8xe+z0aAEQYI+pmJ
	xiw4ehSU6ZFiE8GGFBwL2zV3P5dBEBcir5ouqvtlvAZbd0V3ntOdYSAFwyfn5eUp
	JfQBAXdeKLyl+YwD0k6/kBuPVzfyRb7ZyaIRgq4dnu+B7A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0qm8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 11:20:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093787e2fdso82810771cf.2
        for <devicetree@vger.kernel.org>; Mon, 23 Mar 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774264853; x=1774869653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i5tjGQ5WsisvqjUSW7WzmXu0LITnZly6yrYhXPmtf1U=;
        b=F6HzPIPPKzvsD0GSZemEmpJmXfgpb+IjAi6VGBBCTxG1MYBkYYLT+SxnKvsUN1xR5S
         ml/t8736QwCV37m/Pk/0wCFjMbwGLMGhGe0AaROhtBo+aMzf4gspxzUnlYoMZer4GeEA
         tk8iid+P/dK35BSCV8gg9KYRvNrrdDhu7r2Qskas5quAITmHqhVOB9HLJr+s6u+KuIyR
         Ci2V7vo1KEdhE/oBb7ggK6LeFLy5huKUyaa+vI83p0qiGf0MvmYg8OgEY7Q36zI0pewV
         Rtgl+oGNpa18bShzEe6J+xwMv47J6EEkapi/aiREKEnZ2bWH7XxnHObnfFElr/ZBOL9d
         rrwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774264853; x=1774869653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5tjGQ5WsisvqjUSW7WzmXu0LITnZly6yrYhXPmtf1U=;
        b=h/F75VSVoiE4D/k670YApobwVL5TA13HnUMspP0sBK/yQM5ytArRk4VWDEshEBH68N
         a0usyx+8eT/4fBFAduDyhTmualaGm7CybLkOYA4PfI4dBEVxK82T2YnNm7O13SCO2VKo
         n8x4xSIoc7wmXUYMa2vEEmhrk95FOYtNyOSKyVuvUQfpI3i1KdHyk//EwFO7JQg1w0YO
         jBw2lZkZ+beKUBo7uovF/iO22qj6hEe6shuG8wXY3naJOqjAK72EUbbQOONTKGO3KDzi
         QYM/pWD4eUcwwq4gS1ITxa0SfZbaGh80Kh4YYMBLp3V6uw5SfCsL8GIgLnSiMMAM/Iz3
         aa1w==
X-Forwarded-Encrypted: i=1; AJvYcCWMzLUJKmUYMoUb158oi+zr8ECV0MJOy7pBEANWJsGTSsouhEaKohsjvhJ1sJfqy+2QkNzrrSCp6NCD@vger.kernel.org
X-Gm-Message-State: AOJu0YznIJZFpUDn6ghtIbqJEn97A3n9bgmFwF6pJh/BVa5O9/PthysK
	19B8SoZUzgvHdgp6zluSDN3W4/Gy6PMf2+RiUWRaBWKl93ebr1Nmu422RmQ3MMmHwo7VT3HkWzw
	LFrSCYOSIjDdst2rQkMJ56KgfiJByIL8x1ZSf2dMuHAqI4nue4wSHNESMz6N6//1A
X-Gm-Gg: ATEYQzzddtkmoh6MdkgFxljMFUXwhVfE5wCqV52WmeFX+p4rBM1tSqFzRMIh3/XLDbG
	R/hO4024pDFEE6sPeHEonH2xMp/C2OGFHkgQtajRNef7Ctv+gmdq7TZeWmEx3jU3xol0dIbxsoU
	ZVhSiID3qaKE8XFGFlWai0XTQzeN1U79SVwDgjg9ixvbGEeAOkKhJLuA5qIFm7PTK/oYgSFVzsm
	oCwWROxOhN0M9eDcf2jLo9jgm4ot7HlyeswWGBwoIyNPCZk/uwJT8xq+a3+aGWSEmWH0soCw0Th
	W44w6+xai/86thVk47CsTnk45IUqCkxbDkEQpFZFOAmFtXtWV7++pZz4Fgd4FaCPVUURRwSYHnt
	tTJiB9qCvDVT0gmIqCXsef3fJC+aIsK/neg==
X-Received: by 2002:a05:622a:580f:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50b3c78e117mr162741081cf.41.1774264853236;
        Mon, 23 Mar 2026 04:20:53 -0700 (PDT)
X-Received: by 2002:a05:622a:580f:b0:50b:3c78:ddef with SMTP id d75a77b69052e-50b3c78e117mr162740661cf.41.1774264852738;
        Mon, 23 Mar 2026 04:20:52 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe68ec05sm405653965e9.0.2026.03.23.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:20:51 -0700 (PDT)
Date: Mon, 23 Mar 2026 13:20:50 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Message-ID: <hecpwfi445hkc24mcj4hd7om4ztpeutqn6lmljqcku2nwwchpl@jrvwkdhv4lth>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
 <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
 <hacarw76ftbkirg2ko4t4idpcyqouekodiqb7o2jf2ciscwfi7@egg33tcpahzp>
 <79ae9efc-7f99-4916-996f-52ff5061261b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79ae9efc-7f99-4916-996f-52ff5061261b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c12216 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DDrYQGrwWQwa2y7XVrkA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: aPCLceRVVcCWHuuVxJG2OQcyocyPJcGH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4OCBTYWx0ZWRfX0in6KrszLdgQ
 iSj9qJ1b1qgC8LBWb4QpnqlcFzotAyiZtfIhGufj+X2+n3tUE4xoacaqHV8u2TK0BXAy+yMf8+X
 5+s1MHnMb5g4mZK73S4dFBTMVRP2eMjf/VSkG2V4hriLpJWeXie8n+/4abz7sri2/r7J25D/Rzx
 lDJPlPoQ9xfWbqfC0nEL8sErY+3bnukwCJRoqPLI7NZ8nYLUcuRj5/H2oTEKMiRKmscpnKIOdwR
 ZDCbCz9b+Jt8tznnMSDzaBQ++/JJJoRat/eZc81EcFYBrpvM+StaYW2eHM0RsFXYL1yqGeRuaDG
 wtwjP0RBjlPFaaOH7yDjXIPbIjHBF/zoodNgMihgZAY2sEEAgdTTu0gymDT3tlRxO8WeoQSS6I0
 CFHp4IcjOozmXz9I/LKct63/TlcThM3Gf9pThaTGFGbS8ompRqrWLX8p17jdx4qSlnqF7d8tEdt
 u8HLGsRYA7e5l2692SA==
X-Proofpoint-ORIG-GUID: aPCLceRVVcCWHuuVxJG2OQcyocyPJcGH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230088

On 26-03-23 11:50:37, Konrad Dybcio wrote:
> On 3/22/26 6:51 PM, Dmitry Baryshkov wrote:
> > On Sun, Mar 22, 2026 at 06:08:20PM +0200, Abel Vesa wrote:
> >> Recent discussions off-list highlighted that the GCC should vote for the
> >> RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
> >> aggregate the correct load for the CX rail, potentially leading to voltage
> >> drops and system instability.
> > 
> > Should we add it on other platforms too?
> 
> Things generally work better when powered on

Yep, definitely.
