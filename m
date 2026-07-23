Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C014342AF9A
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784815913; cv=none; b=WycPf0MPDi4BI32O1+PaWA945Yfsi56qGJXPIC9cIMIQkI2Kq39c/zxwDolJJyBCVULawAo2awv5wSgWXDo/MXDl7fOz+GA+IlLhLTQ2sA0T3Gihq3A/+yt8wM2smwZNI5SMjNF4G3tsSN6p0v2L0kw5BYs12LmldDaJbRugi5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784815913; c=relaxed/simple;
	bh=CPhgLJMrgQXkYaTU77cWyLfMwrL56DdAaTzs1u3apfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e04WNL+eIKBPKX0kBeHSgHa23fRea4m+wiuptawo64u2I4Jcoq2oPQY+1wKCA4zx0nXTRq7jnSzbOkVVP6NG12IjroZLy0/tP2bzmi9qKUv67uAHtntZus2snIf6btwja45dcMankLAIrpEk+zeJ6409NhQwN+VwfBVpKrZuUwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2XFfFvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=guFbdkHa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2XFfFvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="guFbdkHa"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCver6038306
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xgtVxRD7OGmZONjmMivsjFjN
	XoH7WW15Kf0VYABqvPM=; b=V2XFfFvvHuT12FLWE3U4UMP8JNSJLohdn60Z1UDE
	c5lkAxxJulKNj7tIEGHxEyHhkHi2c0ZlUOhi+CpFsNwblBDg3rdtT3u76prF4zWx
	nqAfZrQR/xPyOUg/htIcaEDgWfDd3GvaqTQA+0l7U8JXe4shu1SagAw20A1+J2Mr
	wc4nd3anVfhVDnPbiFiobufhbl9Nu5cEcOf3gQ13QWNCvYBRFpujdODSiJmnjNTr
	XgyPhtvzEhla+ZEnz9sYDzp1jrkhuv+ybB2D+p2nkf6nRUdkwIIRHkriyNNsZSrv
	lQGh7pt7OfrTLgaX23bwt6M8h0PvDUtSDmKmheWYPwFJCg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc3n56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 14:11:46 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso7078321cf.2
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 07:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784815904; x=1785420704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xgtVxRD7OGmZONjmMivsjFjNXoH7WW15Kf0VYABqvPM=;
        b=guFbdkHaQTvFZebn0c6nM2jm46xURIao461i0GNG4QHAVd92HrfUDYgNkWwRBK18bO
         /IdvuOs317Y5LykHNJ/v31R7EkKysWln3S09dut6kUwCw40L+NuLG1asE5pw4zt/bqvd
         eiANg3XiL3P3mmH+VwUc/U5eKDn0xaxaEvaCbD7sz0TCNgJKLqnnDPFH7jmOfbxMdxVX
         QjWaDyGZ4VolBzqTvYegU0z78xU5jq2pqQ8mAjqvddlLnF9LOmgcVuGP6mytWW4QFMm9
         4M1zwH+Xn+O4o+7KVwwEX/AmCZx/ay0RosFsXkmONxslAYK4fMvx9X368MElbx/TgHoY
         I8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784815904; x=1785420704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xgtVxRD7OGmZONjmMivsjFjNXoH7WW15Kf0VYABqvPM=;
        b=MVV3zQFk8ZaRCpo4LK5d/gTKdV2rZzC9u0W80JEUdszfoWvlPTC2x01F6D4CnIvNTq
         1giz0YbjU16PC7QZMowm2gxJ7cf/NSUwWtpi8i28TTg60G9OEZWtY5c+u0E9fgkLCQUM
         fC9zd9tCX3b1iW5dJW/kGezyVAT+rx35eNvinY9aZNXh+/ZOaOygOyTuGDRnCzs7bIG6
         L74tEJwCO/xymjAKnNzK/+qzf58sp7vO5lhnE1mQd/Nle1zEqQdI5VOUjKtUPXC/M45m
         QRZHkzP+zG4M9ScSApFKLv8DZ3dM8XqU1td/mfBV9hHNwGGtFYvbOpvVjMyggLHugB2H
         RYAA==
X-Forwarded-Encrypted: i=1; AHgh+RrQt/kolCXRYsavLeBtoJY2XRLWRwt/1SeoTDP0RQzctQeiqMquI39QTHsmMasb9yhWh7B9nnxdi4kK@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+lLGDPO+8XcSarkzv4LgWQJYp9x4qd9vOIAhPg5upbnTfiPI
	ullv2qJj+P16+pNtQQxMfRTrWYw3hLbyZ8ckxEwtQqKEzCv8RzAGM4t97JrlV1LMc7zuBRgtMp4
	yELqSPcQ70WEDJjNIUILV0rvy87ZR1O/QEnqRhEkTuogqjMH8QFI9JCkvVkKgs84X
X-Gm-Gg: AR+sD103UrpMNiDpaIvzZw2jZw9gbZ1DXC+4L4R7oax6gR1XUAuaOMXJDVu+Dq/k7YA
	/aDerQ+8wZKO10HYfm3eijFcMCVvvAt8vCWbK4BGuSYQZlvWj+9fLBxVxpKqK1S/ao2utAmxrZX
	3+ViQevt8G7L+d/sI3hnqUPV6bTBTjXTj9ItszonTOGizdBfZVceIwyaZZyy7imTVjd/3btDiyi
	wYBPjdvn4GWHVl63ZD5T1KKfl7tWj2bU5RoqZ7o+mNK6LBtUz8wFRGmU1ZayW1hYs88XuICG6jw
	QFQaWDwtcI/Dg/ZqvPx/gM6b7H7zIdk9b+UjUziNBMYgDW0Sgi+r98rXpT3NuQKWpfaYmbt6JH2
	rWsvvQZYzDolAEl0=
X-Received: by 2002:ac8:5751:0:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-5283decde2dmr28736051cf.40.1784815903891;
        Thu, 23 Jul 2026 07:11:43 -0700 (PDT)
X-Received: by 2002:ac8:5751:0:b0:51c:1ec5:d0f with SMTP id d75a77b69052e-5283decde2dmr28735401cf.40.1784815903168;
        Thu, 23 Jul 2026 07:11:43 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c53052sm15771693f8f.18.2026.07.23.07.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:11:41 -0700 (PDT)
Date: Thu, 23 Jul 2026 17:11:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: eliza: Add CDSP support and
 enable it on MTP and CQS SoM
Message-ID: <sfrhxa4qoxiagomo43xyfip6roph5crhh3mxe6xo4k3nucrqlf@bnw3smjo2ezk>
References: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-dts-qcom-eliza-add-cdsp-v3-0-93e17e687384@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: tkjDsxX9slEhLi1LGXl3n8qw3L_WbRnW
X-Proofpoint-GUID: tkjDsxX9slEhLi1LGXl3n8qw3L_WbRnW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE0MCBTYWx0ZWRfX1ug58zvEoUox
 FFJ9nPIRlRc4l8Q/Q4N/pEr6CnP8KQLwfmpoLZDjl99r0fqfNwkr3+1jhQIn6s7cgErsgaUs83z
 /OPGr0hqIu6qhTPyphNT+F29AL6qSZQ=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a622122 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=c6uvhakSvUugixP10tEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE0MCBTYWx0ZWRfX/csGPdIS+BPA
 RW82BNU1+ExPeYQYahtnX53c1zQxEJMBxA/TkjiB4KjjyI+F3Q2iGxpxzZOYuLcFkzU9XSftbw4
 PChiFaaGMLeBbcGgylga53kU6gmttVZk+0I2YZys0DRruQZqXR65BROM70J/8t3BgZBVnpq0Abf
 7yftImQ74lXQcwRg8qqSNBNBLZMLmbJjyIzd7coXCNKNqW+Lkws1lYw784vyau9IlwhJpGgXRli
 B/R/2BNTD31rOWV704SDi1sPOIs3saxkWxrVp+n8nPm5kXRXcvWs1VEP6o2e3LVZfpJevd/e9bv
 PvwU/sVcJ/oZKHeBiERrvfvhXsh/JSZulPQfz753ZHwEc6Prg9Xhy/wYdK0NytVKK+VQmyFtXr3
 FBSNPYS7w7xpDRH6m3uk7B9qqwNFvG1DF6ALnVa2GOdqo2hQXN9A1ydy71hd1k12+Db26lWjxeT
 LcFKdHCcp0NNFFyzH8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230140

On 26-07-23 15:25:49, Abel Vesa wrote:
> Describe the CDSP node, the glink-edge and the related SMP2P, then enable
> the CDSP on both the MTP and CQS SoM.
> 
> FastRPC node will be sent later on, along with the ADSP related one.
> 
> Driver support and bindings update are here:
> https://lore.kernel.org/all/20260722-remoteproc-eliza-cdsp-v4-0-04c6eee70cb1@oss.qualcomm.com/

Please ignore this version of v3.

Sent twice since I thought my b4 messed up and did not send it.
Turned out lore was broken.
